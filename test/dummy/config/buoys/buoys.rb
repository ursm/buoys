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

buoy :edit_book_author do |book_id, author_id|
  parent :books
  link "edit-#{book_id}-#{author_id}", "http://example.com/books/#{book_id}/authors/#{author_id}/edit", link_current: true
end
