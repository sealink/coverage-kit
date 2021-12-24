# Coverage::Kit

Configures SimpleCov to enforce coverage is at least exceeds the minimum value but
will also ensure the coverage has not crept up too much (0.5%)

It will also auto configure the `simplecov-rcov` and `simplecov-lcov` formatters.

## HTML Report

To generate a html coverage report include the `simplecov-rcov` gem in the parent project.

## Coveralls

If you want to publish results to coveralls simple include the `simplecov-lcov`
gem in the parent project and use the coveralls github action (https://github.com/marketplace/actions/coveralls-github-action)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coverage-kit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coverage-kit

## Usage

Add to your `spec_helper.rb` file or equivalent
```
require 'simplecov-rcov'
require 'simplecov-lcov'
require 'coverage/kit'

Coverage::Kit.setup(minimum_coverage: 69.95)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/coverage-kit.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
