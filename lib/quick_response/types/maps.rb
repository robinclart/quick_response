module QuickResponse
  class Maps < ::QuickResponse::Base
    format "http://maps.google.com/maps?q=(.*)"

    def initialize(*args)
      args = args.map { |a| CGI.escape(a) }
      super(*args)
    end
  end
end