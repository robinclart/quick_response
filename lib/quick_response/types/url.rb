module QuickResponse
  class URL < ::QuickResponse::Base
    format "http[s]?:\/{2}(.*)", :output => "http://(.*)", :join => "/"
  end
end
