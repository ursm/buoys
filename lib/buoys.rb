# frozen_string_literal: true

require 'buoys/version'
require 'buoys/config'
require 'buoys/loader'
require 'buoys/link'
require 'buoys/buoy'
require 'buoys/renderer'
require 'buoys/helper'

module Buoys
  class << self
    def buoy_file_paths
      @buoy_file_paths ||= [
        Rails.root.join('config', 'buoys', '**', '*.rb')
      ]
    end

    def configure
      yield Buoys::Config
    end
  end
end

require 'buoys/railtie'
