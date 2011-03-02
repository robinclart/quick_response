module QuickResponse
  class Sms < ::QuickResponse::Base
    format "smsto:(.*)", :join => ":", :limit => 2
  end
end
