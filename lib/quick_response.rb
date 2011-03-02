require 'cgi'
require 'uri'
require 'net/http'

module QuickResponse
  autoload :Base,       "quick_response/base"

  autoload :Text,       "quick_response/types/text"
  autoload :Url,        "quick_response/types/url"
  autoload :Email,      "quick_response/types/email"
  autoload :Call,       "quick_response/types/call"
  autoload :Sms,        "quick_response/types/sms"
  autoload :Geo,        "quick_response/types/geo"
  autoload :Maps,       "quick_response/types/maps"

  autoload :Shorthand,  "quick_response/shorthand"

  extend Shorthand
end
