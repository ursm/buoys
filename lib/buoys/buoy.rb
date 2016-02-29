module Buoys
  class Buoy
    attr_reader :previous, :context
    # buoy :account do
    #   link 'Account', account_path
    # end
    #
    # buoy :account_edit do |account|
    #   link 'Account Show', show_account_path(account)
    #   link 'Account Edit', edit_account_path(account)
    #   pre_buoy :account
    # end
    def initialize(context, key, *args)
      block = Buoys::Loader.buoys[key]
      raise ArgumentError, "Buoys :#{key} is not found" unless block

      @key, @context = key, context
      instance_exec *args, &block
    end

    def link(text, *args)
      path = args.shift
      url = path ? context.url_for(path) : path

      links << Buoys::Link.new(text, url, args)
    end

    def links
      @links ||= []
    end

    def pre_buoy(key, *args)
      @previous = Buoys::Buoy.new(context, key, args)
    end
  end

  class Link
    attr_accessor :text, :url, :options

    def initialize(text, url, options)
      @text, @url, @options = text, url, options
    end
  end
end
