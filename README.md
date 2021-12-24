# Coverage::Kit

The purpose of this gem is to provide a common setup for simplecov when used
for publicly released gems.

By default it will generate lcov format in CI mode (useful for Coveralls) and
a html based report in standard development mode.

It also configures SimpleCov to enforce a minimum defined coverage percentage.
It also adds an additional check to ensure the coverage has not crept up too much (0.5%)

## Coveralls

An coveralls compatible lcov file is generated in CI mode, this can be published
with an github action (https://github.com/marketplace/actions/coveralls-github-action)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coverage-kit', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coverage-kit

## Usage

Add to your `spec_helper.rb` file or equivalent
```
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
