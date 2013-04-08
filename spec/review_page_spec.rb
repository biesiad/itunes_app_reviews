# encoding: UTF-8
require 'rspec'
require_relative 'spec_helper'
require_relative '../lib/itunes_app_reviews'

describe ITunesAppReviews::ReviewsPage do
  describe "#reviews" do
    describe "with invalid data" do
      it "returns only valid reviews" do
        page = ITunesAppReviews::ReviewsPage.new(reviews_page_with_errors)
        page.reviews.length.should == 24
      end

      it "returns empty list for all invalid data" do
        page = ITunesAppReviews::ReviewsPage.new("")
        page.reviews.length.should == 0
      end
    end

    describe "with valid data" do
      before :each do
        page = ITunesAppReviews::ReviewsPage.new(reviews_page)
        @reviews = page.reviews
        @review = @reviews[0]
      end

      it "returns reviews list" do
        @reviews.length.should == 25
      end

      it "finds title" do
        @review[:title].should == "LOVE IT!!"
      end

      it "finds name" do
        @review[:name].should == "Genessa Simmons"
      end

      it "finds text" do
        @review[:text].should == "ADDICTING!!! ❤❤❤"
      end

      it "finds rating" do
        @review[:rating].should == "5"
      end

      it "finds date" do
        @review[:date].should == "Apr 6, 2013"
      end

      it "finds version" do
        @review[:version].should == "1.6.4"
      end
    end
  end
end
