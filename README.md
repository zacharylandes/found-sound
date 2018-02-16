# The Pivot - Base Project
[![Build Status](https://travis-ci.org/Maxscores/le_pivot.svg?branch=master)](https://travis-ci.org/Maxscores/le_pivot)

[![Coverage Status](https://coveralls.io/repos/github/Maxscores/le_pivot/badge.svg?branch=master)](https://coveralls.io/github/Maxscores/le_pivot?branch=master)

The following Rails app is used as the base project for [The Pivot](http://backend.turing.io/module3/projects/the_pivot).

## Project Description

This brownfield project is a multitenant e-commerce web application, entitled Found Sound. It was a 2-week group project with a 4-member team from the Turing School of Software and Design (Denver, CO).

## Deployment

Project is deployed at:
https://le-pivot-1710.herokuapp.com/

## Developers

* Gabe Afflitto
* Lee Chow
* Zach Landes
* Max Stackhouse

## Instructor

* Josh Mejia

## Setup

Built using Ruby 2.4.1 and Rails 5.1.3

Install required gems:
`$ bundle install`

Setup Database:
`$ rake db:create db:migrate`

Load the database dump:
`$ rake import_dump:load`

Run rake tasks:
`$ rake migrate_data:all`

Setup redis server (for Live Chat messaging queue). Keep redis server running during both testing and when running local server.
`$ brew install redis`
`$ redis-server`

After the import you should see a return value of 1011 when running `Item.count` in the console.

All users have a password of `password` if you want to login and explore.

## Testing Suite (Rspec with Capybara)
`$ brew install redis`
`$ redis-server`
`$ rspec`

## API Endpoints
Item title and description can be searched using this endpoint:
get `/api/v1/search?type=items&q=[query]&api_key=[your_api_key]`
You can create a valid default API key by setting ENV['search_api_key'] in your environment.

## Schema
![Schema](https://raw.githubusercontent.com/maxscores/le_pivot/master/db/schema.png)
