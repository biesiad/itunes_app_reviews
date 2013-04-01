# encoding: UTF-8
require_relative 'review_page'
require 'httpclient'
require 'open-uri'
require 'open_uri_redirections'
require 'csv'
require 'date'

module AppStoreReviews
  class Reviews
    attr_writer :start_date

    def initialize(store_id, app_id)
      @store_id = store_id
      @app_id = app_id
    end

    def each
      page = 0
      while true
        page += 1
        reviews = page_reviews(page)

        break if reviews.empty?

        reviews.each do |review|
          yield review
        end
      end
    end

    def page_reviews(page)
      url = "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?sortOrdering=4&onlyLatestVersion=false&sortAscending=true&pageNumber=#{(page - 1)}&type=Purple+Software&id=#{@app_id}"
      f = open(url, "User-Agent" => "iTunes-iPhone/2.2 (2)", "X-Apple-Store-Front" => "#{@store_id}-1", :allow_safe_redirections => true)
      page_text = f.read
      AppStoreReviews::ReviewPage.new(page_text, page).items
    end
  end
end
