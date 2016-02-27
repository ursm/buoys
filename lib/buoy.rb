require 'buoy/version'

module Buoy
  class << self
    def buoy_file_paths
      @buoy_file_paths ||= [
        Rails.root.join('config', 'buoys', '**', '*.rb')
      ]
    end
  end
end
