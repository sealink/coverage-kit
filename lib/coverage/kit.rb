require "coverage/kit/version"

module Coverage
  module Kit
    def self.setup(minimum_coverage: )
      return if ENV['COVERAGE'] == 'off'

      @minimum_coverage = minimum_coverage
      @maximum_coverage = @minimum_coverage + 0.5

      require 'simplecov'
      formatters = []
      formatters << SimpleCov::Formatter::RcovFormatter if defined?(SimpleCov::Formatter::RcovFormatter)

      if (defined?(SimpleCov::Formatter::LcovFormatter))
        SimpleCov::Formatter::LcovFormatter.config do |c|
          c.report_with_single_file = true
          c.single_report_path = 'coverage/lcov.info'
        end

        formatters << SimpleCov::Formatter::LcovFormatter
      end
      SimpleCov.formatters = formatters

      SimpleCov.start do
        add_filter '/vendor/'
        add_filter '/config/'
        add_filter '/spec/'
        add_group 'lib', 'lib'
      end

      SimpleCov.at_exit do
        SimpleCov.result.format!
        percent = SimpleCov.result.covered_percent
        puts "Coverage is #{'%.2f' % percent} (min: #{@minimum_coverage})"
        if percent < @minimum_coverage
          puts "Coverage must be above #{@minimum_coverage}"
          Kernel.exit(1)
        elsif percent > @maximum_coverage
          puts "Coverage must be below #{@maximum_coverage}. Time to bump coverage!"
          Kernel.exit(1)
        end
      end
    end
  end
end
