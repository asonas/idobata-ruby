# Idobata

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'idobata'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idobata

## Usage

```
require 'idobata'

# set hook url
Idobata.hooK_url = "https://idobata.io/hook/XXXXX"

# plain text
Idobata::Message.create(source: "Hello, Idobata!")

# html format
Idobata::Message.create(source: "<marquee>Hello, Idobata!</marquee>", format: :html)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
