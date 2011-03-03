module QuickResponse
  class Email < ::QuickResponse::Base
    format "mailto:(.*)", :limit => 1
  end
end
