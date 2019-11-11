# Description

This is a simple codebase for making api call, for REST Api Workshop Nov 2019.

# Setup

The script should work with Ruby 2.0 and above.

Assuming you have Ruby installed on your machine, all you need to do is
clone the project and run a few steps:

```
git clone git@github.com:peishiyong/rest_api_workshop.git
cd rest_api_workshop

cp config/env.yaml.example config/env.yaml

bundle install # if failed, do `gem install bundler` and try again
bundle exec ruby example.rb
```

If all good, you should see 'hello world'. Get a :doughnut: to celebrate!

## Commands

* List tickets: `bundle exec ruby ./runner/list.rb`
* Create ticket: `bundle exec ruby ./runner/create.rb`
* Update ticket: `bundle exec ruby ./runner/update.rb`
* Delete ticket: `bundle exec ruby ./runner/delete.rb`

### Debugging mode

Append `debug` at the end of the command to print more detailed response. Eg:

```
bundle exec ruby ./runner/list.rb debug
```
