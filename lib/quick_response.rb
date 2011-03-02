require 'cgi'
require 'uri'

module QuickResponse
  autoload :Base,       "quick_response/base"

  autoload :Text,       "quick_response/types/text"
  autoload :URL,        "quick_response/types/url"
  autoload :Email,      "quick_response/types/email"
  autoload :Call,       "quick_response/types/call"
  autoload :SMS,        "quick_response/types/sms"
  autoload :Geo,        "quick_response/types/geo"

  autoload :Shorthand,  "quick_response/shorthand"

  extend Shorthand
end
