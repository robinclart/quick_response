module QuickResponse
  module Shorthand
    def new(*args)
      args.first.is_a?(Symbol) ? send(*args) : text(*args)
    end

    def text(*args)
      ::QuickResponse::Text.new(*args)
    end

    def url(*args)
      ::QuickResponse::Url.new(*args)
    end

    def email(*args)
      ::QuickResponse::Email.new(*args)
    end

    def call(*args)
      ::QuickResponse::Call.new(*args)
    end

    def sms(*args)
      ::QuickResponse::Sms.new(*args)
    end

    def geo(*args)
      ::QuickResponse::Geo.new(*args)
    end

    def maps(*args)
      ::QuickResponse::Maps.new(*args)
    end
  end
end