module QuickResponse
  class Geo < ::QuickResponse::Base
    format "geo:(.*)", :join => ",", :limit => 2
  end
end
