module QuickResponse
  class Maps < ::QuickResponse::Base
    format "http://maps.google.com/maps?q=(.*)", :limit => 1, :query => true
  end
end