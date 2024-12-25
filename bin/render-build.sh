#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec ./bin/rails assets:precompile
bundle exec ./bin/rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

bundle exec ./bin/rails db:migrate
bundle exec ./bin/rails db:seed