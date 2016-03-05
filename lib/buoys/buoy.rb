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

    def link(key, *args)
      path = args.shift
      url = path ? context.url_for(path) : path

      text =
        case key
        when String
          key
        when Symbol
          I18n.t(key, scope: 'buoys.breadcrumbs')
        end

      links << Buoys::Link.new(text, url, args.extract_options!)
    end

    def links
      @links ||= []
    end

    def pre_buoy(key, *args)
      @previous = Buoys::Buoy.new(context, key, args)
    end
    alias_method :parent, :pre_buoy

    def method_missing(method, *args, &block)
      context.send(method, *args, &block)
    end
  end
end
