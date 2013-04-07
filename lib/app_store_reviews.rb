require "logger"
require "app_store_reviews/stores"
require "app_store_reviews/reviews"

module AppStoreReviews
  @@log = Logger.new(NIL)
  @@log.level = Logger::ERROR

  def self.log=(log); @@log = log end
  def self.log; @@log end
end
