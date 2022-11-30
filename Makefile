test:
	bundle exec rspec

build:
	bundle install --path 'vendor/bundle'

serve:
	bundle exec ruby hello_world.rb