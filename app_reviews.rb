# encoding: UTF-8
require_relative 'lib/app_store_reviews'
  puts "Starting\n"

  app_id = 539124565
  store_id = 143507

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

  puts "Done."
