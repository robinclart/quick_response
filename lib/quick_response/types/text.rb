module QuickResponse
  class Text < ::QuickResponse::Base
    format "(.*)", :join => " "
  end
end
