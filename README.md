[![Build Status](https://travis-ci.org/biesiad/itunes_app_reviews.png)](https://travis-ci.org/biesiad/itunes_app_reviews)
[![Code Climate](https://codeclimate.com/github/biesiad/itunes_app_reviews.png)](https://codeclimate.com/github/biesiad/itunes_app_reviews)
[![Gem Version](https://badge.fury.io/rb/itunes_app_reviews.png)](http://badge.fury.io/rb/itunes_app_reviews)

# ITunesAppReviews

Download user reviews from iTunes (iOS App Store)

## Installation

Add this line to your application's Gemfile:

    gem 'itunes_app_reviews'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itunes_app_reviews

## Usage

Create reviews object with selected store ID and application ID.

```ruby
app_id = 123456789
store_id = ITunesAppReviews::Stores['United States']

reviews = ITunesAppReviews::Reviews.new(store_id, app_id)
reviews.each do |review|
  puts "title: #{review[:title]}"
  puts "name: #{review[:name]}"
  puts "text: #{review[:text]}"
  puts "rating: #{review[:rating]}"
  puts "date: #{review[:date]}"
  puts "version: #{review[:version]}"
  puts
end
```

For logging provide logger to `ITunesAppReviews` module and set desired logging level. By default logs go to `/dev/null` with level `ERROR`.

```ruby
ITunesAppReviews.log = Logger.new(STDOUT)
ITunesAppReviews.log.level = Logger::DEBUG
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
