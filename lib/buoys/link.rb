module Buoys
  class Link
    attr_accessor :text, :url, :options

    def initialize(text, url, options)
      @text, @url, @options = text, url, options
    end
  end
end
