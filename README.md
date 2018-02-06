# The Pivot - Base Project
[![Build Status](https://travis-ci.org/Maxscores/le_pivot.svg?branch=master)](https://travis-ci.org/Maxscores/le_pivot)

[![Coverage Status](https://coveralls.io/repos/github/Maxscores/le_pivot/badge.svg?branch=master)](https://coveralls.io/github/Maxscores/le_pivot?branch=master)

The following Rails app is used as the base project for [The Pivot](http://backend.turing.io/module3/projects/the_pivot).

## Setup

Built using Ruby 2.4.1 and Rails 5.1.3

Install required gems:
`$ bundle install`

Setup Database:
`$ rake db:create db:migrate`

Load the database dump:
`$ rake import_dump:load`

After the import you should see a return value of 1011 when running `Item.count` in the console.

All users have a password of `password` if you want to login and explore.
