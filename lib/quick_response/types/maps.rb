module QuickResponse
  class Maps < ::QuickResponse::Base
    format "http://maps.google.com/maps?q=(.*)", :limit => 1

    def initialize(*args)
      args = args.map { |a| CGI.escape(a) }
      super(*args)
    end
  end
end