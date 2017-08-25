#!/bin/sh

export RAILS_ENV=production

bin/rake assets:precompile
bin/rake db:create
bin/rake db:migrate

exec bundle exec puma -C config/puma.rb
