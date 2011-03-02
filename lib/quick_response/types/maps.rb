module QuickResponse
  class Maps < ::QuickResponse::Base
    format "http://maps.google.com/maps?q=(.*)"

    def initialize(*args)
      super(*args.each { |a| CGI.escape(a) })
    end
  end
end