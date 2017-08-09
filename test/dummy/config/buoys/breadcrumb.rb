# frozen_string_literal: true

buoy :about do
  link 'about', about_path
end

buoy :history do
  pre_buoy :about
  link 'history', history_path
end

buoy :help do |is_ssl|
  link 'help',  "#{is_ssl ? 'https' : 'http'}://example.com/help"
  link 'usage', "#{is_ssl ? 'https' : 'http'}://example.com/help/usage"
end
