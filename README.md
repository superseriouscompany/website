# Super Serious Website

## Requirements

1. rvm
1. http://postgresapp.com/
1. memcached
1. ruby 2.1.2
1. rails 4.2.0

## Installation
    $ brew install memcached
    $ rvm install 2.1.2
    $ rvm use 2.1.2
    $ bundle install

## Running

    $ rails s

## Managing database

Add new entries to `seeds.rb` and then run:

    $ rake db:schema:load db:seed

### Rails-specific stuff to change if we migrate off

* turbolinks google analytics integration
* image_tag and asset-path helpers
* erb
