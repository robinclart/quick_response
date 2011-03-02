module QuickResponse
  class Maps < ::QuickResponse::Base
    format "http://maps.google.com/maps?q=(.*)"
  end
end