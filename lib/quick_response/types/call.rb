module QuickResponse
  class Call < ::QuickResponse::Base
    format "tel:(.*)"
  end
end
