# encoding: UTF-8
require 'nokogiri'
require 'rexml/document'
include REXML

module AppStoreReviews
  class ReviewPage
    LINK_SELECTOR = "Document > View > ScrollView > VBoxView > View > MatrixView > VBoxView > VBoxView > VBoxView"

    def initialize(page_content)
      doc = Nokogiri::XML("")
      @links = doc.css(LINK_SELECTOR)
    end

    def reviews
      @links.reduce([]) do |reviews, current|
        review = parse(current)
        reviews << review if review
      end
    end

    def parse(link)
      node = link.css('TextView > SetFontStyle')
      info = node[2].content.split(" - ")
      version = info[1].strip()[-5, 5]
      date = info[2].strip()

      name_el = node.css('GotoURL > b')
      name = name_el.first.content.strip

      title_el = node[0].css('b')
      title = title_el.first.content

      text = node[3].content.strip

      node = link.css('HBoxView > HBoxView > HBoxView')
      rating = node.attr('alt').value

      print link if date.nil?

      {
        title: title,
        name: name,
        text: text.gsub(/(\s){2,}/, " "),
        rating: rating.delete(" Stars"),
        date: date,
        version: version
      }

    rescue StandardError => e
      print e.message
      nil
    end
  end
end
