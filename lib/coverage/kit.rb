require "coverage/kit/version"
require "simplecov"
require "simplecov-lcov"

module Coverage
  module Kit
    def self.setup(minimum_coverage: )
      return if ENV['COVERAGE'] == 'off'

      @minimum_coverage = minimum_coverage
      @maximum_coverage = @minimum_coverage + 0.5

      SimpleCov.start do
        if ENV['CI']
          SimpleCov::Formatter::LcovFormatter.config do |c|
            c.report_with_single_file = true
            c.single_report_path = 'coverage/lcov.info'
          end
          formatter SimpleCov::Formatter::LcovFormatter
        else
          formatter SimpleCov::Formatter::MultiFormatter.new([
            SimpleCov::Formatter::SimpleFormatter,
            SimpleCov::Formatter::HTMLFormatter
          ])
        end

        enable_coverage :branch

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
