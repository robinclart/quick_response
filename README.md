# QuickResponse

QuickResponse is a **QR Code Generator**. It doesn't rely on any image manipulation library. Instead it's thin wrapper around the **Google Chart API**.

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


