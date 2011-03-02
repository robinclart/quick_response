module QuickResponse
  class Email < ::QuickResponse::Base
    format "mailto:(.*)"
  end
end
