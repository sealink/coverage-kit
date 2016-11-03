require "coverage/kit/version"

module Coverage
  module Kit
    def self.setup(minimum_coverage: )
      return if ENV['COVERAGE'] == 'off'

      @minimum_coverage = minimum_coverage
      @maximum_coverage = @minimum_coverage + 0.5

      require 'simplecov'
      Coveralls.wear! if defined?(Coveralls)

      formatters = []
      formatters << SimpleCov::Formatter::RcovFormatter if defined?(SimpleCov::Formatter::RcovFormatter)
      formatters << Coveralls::SimpleCov::Formatter if defined?(Coveralls)
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
