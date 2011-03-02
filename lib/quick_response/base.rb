module QuickResponse
  class Base
    GOOGLE_CHART_API = "http://chart.apis.google.com/chart"
    DEFAULT_OPTIONS  = { :size => 256 }

    def initialize(*args)
      # Extract options
      options = args.last.is_a?(Hash) ? DEFAULT_OPTIONS.merge(args.pop) : DEFAULT_OPTIONS

      @chl = to_format(args)
      @chs = options[:size]
    end

    def content
      @chl
    end

    def size
      @chs
    end
    
    def size=(size)
      @chs = size
    end

    def image_url
      uri = URI.parse(GOOGLE_CHART_API)
      uri.query = [cht, chs, chl].join("&")
      uri.to_s
    end

    private

    def cht
      param :cht, "qr"
    end

    def chs
      param :chs, "?x?".gsub("?", size.to_s)
    end

    def chl
      param :chl, CGI.escape(content)
    end

    def param(key, value)
      [key.to_s, value].join("=")
    end

    def self.format(format, options = {})
      define_method :to_format do |args|
        args = args.slice(0, options[:limit]) if options[:limit]
        str  = args.join(options[:join])

        if str.match(Regexp.new(format))
          str
        else # If the argument doesn't match the format.
          (options[:output] || format).gsub("(.*)", str)
        end
      end
      private :to_format
    end
  end
end
