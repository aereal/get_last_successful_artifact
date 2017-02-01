# GetLastSuccessfulArtifact

Get last successful artifact URI from Jenkins

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'get_last_successful_artifact'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install get_last_successful_artifact

## Usage

```ruby
require 'get_last_successful_artifact'

getter = GetLastSuccessfulArtifact.new(jenkins_origin: 'http://example.com/your-jenkins', job_name: 'Create-Release')
getter.get # => http://example.com/your-jenkins/job/Create-Release/1/artifact/Create-Release.tar.gz
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/get_last_successful_artifact.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

