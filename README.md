# Capistrano grove.io notifications

Easily send notifications to your [grove.io](http://grove.io) channel after a deploy.

## Getting started

In your application's `Gemfile` put the following:

    gem 'capistrano-grove', 'git://github.com/spikegrobstein/capistrano-grove.git'

Once you get your gems installed via `bundle install`, you can configure
`capistrano-grove`.

The only required parameter to use this plugin is the `grove_channel_key` variable.
You should initialize it as follows:

    set :grove_channel_key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

`capistrano-grove` comes with one task: `grove:notify`. This task posts the
`grove_message` variable to the grove.io service and will be usable after you set
the above variable.

To automatially notify on grove.io after a deploy, set an `after` hook:

    after 'deploy', 'grove:notify'

## Variables

Documentation on the following variables coming soon.

### grove_channel_key

### grove_service

### grove_icon_url

### grove_url

### grove_message
