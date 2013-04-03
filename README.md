# Capistrano::Grove [![Build Status](https://travis-ci.org/spikegrobstein/capistrano-grove.png)](https://travis-ci.org/spikegrobstein/capistrano-grove)

Send deployment notifications to your [grove.io](http://grove.io) channel via Capistrano.
Never again will members of your team not be made aware of events during your deployment.
Alert them to maintenance page changes, migrations and deployment events by using this gem.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-grove'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-grove

In your `Capfile`, add:

    require 'capistrano-grove'

## Getting started

Capistrano::Grove is built on Capnotify which provides a series of built-in notifications.
This gem plugs into those notifications and sends them to your grove.io channel.

Once you've gone through the above installation procedure, all you need to do is set
your `grove_channel_token` as a Capistrano variable as follows:

    set :grove_channel_key, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

With that, you'll start receiving notifications to your channel for migrations,
deployment and maintenance page changes.

You can also use the `grove.notify` function anywhere in your Capistrano recipes to post
messages to your channel ad-hoc. For example:

    grove.notify 'Greetings from Capistrano!'

## Variables

The following are Capistrano variables and are used via the `set` function.

### grove_channel_token

The channel key from the grove.io website. This is the only variable that is required
to get Capistrano::Grove working.

### grove_service

The name of the service, aka the handle of the user, that the notification comes from.

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

