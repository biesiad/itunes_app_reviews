# encoding: UTF-8

def reviews_page
  File.read('spec/fixtures/reviews_page.xml')
end

def reviews_page_with_errors
  File.read('spec/fixtures/reviews_page_with_errors.xml')
end
