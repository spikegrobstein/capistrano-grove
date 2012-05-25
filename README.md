# Capistrano grove.io notifications

Easily send notifications to your grove.io channel after a deploy.

## Getting started

`capistrano-grove` depends on the `grove-rb` gem. I've made a fork of it and
built on considerable additions for this plugin, but the author has not yet
merge my changes and made a release. In the interim, you'll need to include my
fork of the gem in your `Gemfile`.

In your application's `Gemfile` put the following:

    gem 'capistrano-grove', 'git://github.com/spikegrobstein/capistrano-grove.git'
    gem 'grove-rb', :git => 'git://github.com/spikegrobstein/grove-rb.git'

Once you get your gems installed via `bundle install`, you can configure
`capistrano-grove`.

## Variables

`capistrano-grove` supports several options 
