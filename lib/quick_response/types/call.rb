module QuickResponse
  class Call < ::QuickResponse::Base
    format "tel:(.*)", :limit => 1
  end
end
