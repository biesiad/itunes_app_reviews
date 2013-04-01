# encoding: UTF-8
require 'rspec'
require_relative '../lib/app_store_reviews'

describe AppStoreReviews::ReviewPage do
  describe "#reviews" do
    it "returns reviews list" do
      review_page = AppStoreReviews::ReviewPage.new("")
      review_page.reviews.length.should == 10
    end

    it "returns only valid reviews" do
      review_page = AppStoreReviews::ReviewPage.new("")
      review_page.reviews.length.should == 10
    end

    it "returns empty list for invalid data" do
      review_page = AppStoreReviews::ReviewPage.new("")
      review_page.reviews.length.should == 0
    end
  end

  describe "#parse" do
    context "with valid data" do
      before :each do
        review_page = AppStoreReviews::ReviewPage.new("")
        @link = review_page.parse("")
      end

      it "returns object if can parse link" do
        @link.should_not be_nil
      end

      it "finds title" do
        @link[:title].should == ""
      end

      it "finds name" do
        @link[:name].should == ""
      end

      it "finds text" do
        @link[:text].should == ""
      end

      it "finds rating" do
        @link[:rating].should == ""
      end

      it "finds date" do
        @link[:date].should == ""
      end

      it "finds version" do
        @link[:version] == ""
      end
    end

    it "returns nil if can't parse link" do
      link = @review_page.parse("")
      link.should be_nil
    end
  end
end
