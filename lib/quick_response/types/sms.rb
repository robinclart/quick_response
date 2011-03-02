module QuickResponse
  class SMS < ::QuickResponse::Base
    format "smsto:(.*)", :join => ":", :limit => 2
  end
end
