# AppStoreReviews

Download user reviews from iTunes (iOS App Store)

## Installation

Add this line to your application's Gemfile:

    gem 'app_store_reviews'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app_store_reviews

## Usage

Create reviews object with selected store ID and application ID.

```ruby
  app_id = 123456789
  store_id = AppStoreReviews::Stores['United States']

  reviews = AppStoreReviews::Reviews.new(store_id, app_id)
  reviews.each do |review|
    puts "title: #{review[:title]}"
    puts "name: #{review[:name]}"
    puts "text: #{review[:text]}"
    puts "rating: #{review[:rating]}"
    puts "date: #{review[:date]}"
    puts "version: #{review[:version]}"
    puts
  end
```ruby

For logging provide logger to `AppStoreReviews` module and set desired logging level. By default logs go to `/dev/null` with level `ERROR`.

```ruby
AppStoreReviews.log = Logger.new(STDOUT)
AppStoreReviews.log.level = Logger::DEBUG
```ruby

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
