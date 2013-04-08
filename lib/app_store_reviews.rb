require "logger"
require "itunes_app_reviews/stores"
require "itunes_app_reviews/reviews"

module AppStoreReviews
  @@log = Logger.new(STDOUT)
  @@log.level = Logger::ERROR

  def self.log=(log); @@log = log end
  def self.log; @@log end
end
