# Capistrano grove.io notifications

Easily send notifications to your [grove.io](http://grove.io) channel after a deploy.

## Getting started

In your application's `Gemfile` put the following:

    gem 'capistrano-grove', 'git://github.com/spikegrobstein/capistrano-grove.git'

At the top of your `Capfile` you should also add the following:

    require 'grove/capistrano'

Once you get your gems installed via `bundle install`, you can configure
`capistrano-grove`.

The only required parameter to use this plugin is the `grove_channel_key` variable.
You can get your channel key from the grove.io website. Initialize it as follows:

    set :grove_channel_key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

`capistrano-grove` comes with one task: `grove:notify`. This task posts the
`grove_message` variable to the grove.io service and will be usable after you set
the above variable.

To automatially notify on grove.io after a deploy, set an `after` hook:

    after 'deploy', 'grove:notify'

## Variables

### grove_channel_key

The channel key from the grove.io website. This is the only variable that is required
to get `capistrano-grove` working.

### grove_service

The name of the service that the notification comes from. This should not contain
spaces as that causes the grove.io webservice some grief.

### grove_icon_url

This is the URL to the icon that your notification uses.

### grove_url

When clicking your notification in the grove.io notification window, this is the URL
that you're taken to.

### grove_message

Each time that the `grove:notify` task is run, `grove_message` is the message that
is posted. Typically, you'd want to set this with a block so it can be lazily
evaluated.

It defaults to:

    "Successful deployment of #{ fetch(:application, 'application') }."

## Author

`capistrano-grove` is written by Spike Grobstein  
spikegrobstein@mac.com  
http://spike.grobste.in  
https://github.com/spikegrobstein  

## License

&copy;2012 Spike Grobstein
MIT License (see `LICENSE` file included in this package).

