#!/bin/bash
cd /site
bundle install --without development test
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake assets:clean assets:precompile
chown rails:rails /site -R
touch tmp/restart.txt