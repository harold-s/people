# People

[ ![Codeship Status for storyful/people](https://app.codeship.com/projects/58f02080-2125-0135-e640-3aa0d94115e3/status?branch=master)](https://app.codeship.com/projects/221242)

Project for Testing & Automation (Guild) practices.

* Ruby version

This project was created and tested with Ruby 2.4.0.

* System dependencies

* Configuration

```bash
cp config/database_sample.yml config/database.yml
```

* Database creation

* Database initialization

* How to run the test suite

```bash
# RVM will automatically pick up your Ruby version from a .ruby-version file, or
# parse a version specified in your Gemfile. You can also explicitly switch to a
# specific version via the following command:
# rvm use 2.4.0 --install
bundle install

# Make sure Ruby on Rails knows we are in the the test environment.
export RAILS_ENV=test

# Prepare the test database
bundle exec rake db:schema:load
bundle exec rake db:migrate
bundle exec rake db:test:prepare

bundle exec rspec spec
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
