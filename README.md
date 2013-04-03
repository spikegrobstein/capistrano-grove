# Capistrano::Grove [![Build Status](https://travis-ci.org/spikegrobstein/capistrano-grove.png)](https://travis-ci.org/spikegrobstein/capistrano-grove)

Note: This documentation is for the as yet to be released version 2.0.0 of Capistrano::Grove.
I expect this to be ready for release in the next few days.

Send deployment notifications to your [grove.io](http://grove.io) channel via Capistrano.
Never again will members of your team not be made aware of events during your deployment.
Alert them to maintenance page changes, migrations and deployment events by using this gem.

## Installation

Add this line to your application's Gemfile:

    gem "capistrano-grove", "~> 2.0.0pre1"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-grove --pre

In your `Capfile`, add:

    require 'capistrano-grove'

## Getting started

Capistrano::Grove is built on Capnotify which provides a series of built-in notifications.
This gem plugs into those notifications and sends them to your grove.io channel.

Once you've gone through the above installation procedure, all you need to do is set
your `grove_channel_token` as a Capistrano variable as follows:

    set :grove_channel_token, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

With that, you'll start receiving notifications to your channel for migrations,
deployment and maintenance page changes.

In addition to the above, you can configure how your messages appear:

    set :grove_service_name, 'MyDeployer'
    set :grove_icon_url, 'https://grove.io/static/img/webapp-logo.png'
    set :grove_url, 'http://example.com'

Because Capistrano::Grove is built on Capnotify, you should refer to that documentation
for further customizing the messages that are posted to your channel:

https://github.com/spikegrobstein/capnotify

You can also use the `grove.notify` function anywhere in your Capistrano recipes to post
messages to your channel ad-hoc. For example:

    grove.notify 'Greetings from Capistrano!'

## Variables

The following are Capistrano variables and are used via the `set` function.

### grove_channel_token

The channel token from the grove.io website. This is the only variable that is required
to get Capistrano::Grove working.

### grove_service

The name of the service, aka the handle of the user, that the notification comes from.
This defaults to 'Deploybot'

*This should not contain spaces as that causes the grove.io webservice some grief.*

### grove_icon_url

This should be a URL to an image that the service will use as its avatar in the channel.

### grove_url

When clicking your notification in the grove.io notification window, this is the URL
that you're taken to.

## Functions

### grove.notify

Capistrano::Grove comes with a single function: `grove.notify` for posting messages
to your channel. It takes a single parameter-the message to post.

Example:

    grove.notify "That was easy!"

## Author

Capistrano::Grove is written by Spike Grobstein  
spikegrobstein@mac.com  
http://spike.grobste.in  
https://github.com/spikegrobstein  

## License

&copy;2012-2013 Spike Grobstein  
MIT License (see `LICENSE` file included in this package).

