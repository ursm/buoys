buoy :account do
  link :account, 'http://example.com/account'
end

buoy :books do
  link 'Books', 'http://example.com/books'
end

buoy :show_books do |number|
  parent :books
  link "show-#{number}", "http://example.com/books/#{number}", link_current: true
end
