# encoding: UTF-8
require_relative 'reviews_page'
require 'httpclient'
require 'open-uri'
require 'open_uri_redirections'
require 'csv'
require 'date'

module ITunesAppReviews
  class Reviews
    attr_writer :start_date

    def initialize(store_id, app_id)
      @store_id = store_id
      @app_id = app_id
    end

    def each
      ITunesAppReviews::log.debug("Loading reviews (store_id: #{@store_id}, app_id: #{@app_id})")
      page = 0
      while true
        page += 1
        reviews = reviews_page(page)

        break if reviews.empty?

        reviews.each do |review|
          yield review
        end
      end
    end

    def reviews_page(page_number)
      url = "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?sortOrdering=4&onlyLatestVersion=false&sortAscending=true&pageNumber=#{(page_number - 1)}&type=Purple+Software&id=#{@app_id}"
      f = open(url, "User-Agent" => "iTunes-iPhone/2.2 (2)", "X-Apple-Store-Front" => "#{@store_id}-1", :allow_safe_redirections => true)
      page_text = f.read
      ITunesAppReviews.log.debug("Loading page #{page_number} (store_id: #{@store_id}, app_id: #{@app_id})")
      ITunesAppReviews.log.debug(page_text)
      ITunesAppReviews::ReviewsPage.new(page_text).reviews
    end
  end
end
