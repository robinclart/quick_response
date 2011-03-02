module QuickResponse
  class Url < ::QuickResponse::Base
    format "http[s]?:\/{2}(.*)", :output => "http://(.*)", :join => "/"
  end
end
