# QuickResponse

QuickResponse is a **QR Code Generator**. It doesn't rely on any image manipulation library. Instead it's a thin wrapper around the **Google Chart API**.

## Installation

    gem install quick_response
    
## Usage

### Initialization 

First you need to create a QuickResponse object. For example to create a simple textual QR code:

    QuickResponse::Text.new("Hello World!")

…or for a url:

    QuickResponse::Url.new("robinclart.com")

You can also specify a size option:

    QuickResponse::Url.new("robinclart.com", :size => 512)

### Shorthand

You can also use one of the shorthand versions:

    QuickResponse.new(:text, "Hello World!")

…or:

    QuickResponse.text("Hello World!")

### Methods

Once you have your QR object you have two methods available:

  * The first one is `image_url`. This method will return the image url as you can guess.
  * The second one is `save`. This method takes one argument that must be a string representing the local path where to save the image.
  
Examples:

    qr = QuickResponse.url("robinclart.com")
    
    qr.image_url
    => "http://chart.apis.google.com/chart?cht=qr&chs=256x256&chl=http%3A%2F%2Frobinclart.com"
    
    qr.save("/tmp/qr/robinclart_com.png")

### Types

Available types are:

  * Text (Takes many arguments that will be joined by a space)
  * Url (Takes an url as first argument)
  * Email (The first argument is a mail address)
  * Call (The first argument is a phone number)
  * Sms (The first argument is a phone number, the second (optional) is the message)
  * Geo (Takes two arguments `longitude` and `lattitude`)
  * Maps (Take an address as first argument and return a link to Google Maps)

## Write Your Own Type

First you need to know what a type is. Basically a type is a class that inherit from QuickResponse::Base and defines a `to_format` instance method. Simple isn't it?

### Requirements

In order to work the `to_format` must accept an unlimited number of arguments and return a string.

### Real Life Examples

Let's take a look at the `Call:Class`:

    module QuickResponse
      class Call < ::QuickResponse::Base
        format "tel:(.*)", :limit => 1
      end
    end

Here the `format` class method will generate dynamically a to_format method with the right behavior for us.

But what is it doing exactly? It's gonna check if the supplied argument match the format. If yes it will just return it untouched. If not it will replace the "(.\*)" sequence by the argument.  
As a result of this, these two lines will output the same result

    QuickResponse.call("+1234567890")
    => #<QuickResponse::Call @content="tel:+1234567890", @size=256>
    
    QuickResponse.call("tel:+1234567890")
    => #<QuickResponse::Call @content="tel:+1234567890", @size=256> 

This is particularly useful with the `Url:Class` because if you had already supply http or https it won't add the protocol again.

    module QuickResponse
      class Url < ::QuickResponse::Base
        format "http[s]?:\/{2}(.*)", :output => "http://(.*)", :join => "/"
      end
    end

### The `format` Options

  * join(String): The join between the arguments
  * limit(Integer): The number of arguments the class accepts
  * output(String): If your first argument is too complex and can't be replaced. (i.e. `Url:Class`)
  * query(Boolean): If set to true the arguments will be escaped.

### A `Search` Type

Let's say we want to create a new type which lets us pass a query to a search engine:

    # WARNING: This class is not included in the gem.
    module QuickResponse
      def self.search(query)
        ::QuickResponse::Search.new(query)
      end
      
      class Search < ::QuickResponse::Base
        format "http://www.google.com/search?q=(.*)", :limit => 1, :query => true
      end
    end

We can now do:

    QuickResponse.search("Robin Clart")
    => #<QuickResponse::Search @content="http://www.google.com/search?q=Robin+Clart", @size=256>
