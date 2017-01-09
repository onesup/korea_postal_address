# Korea postal address gem

Give road name address or old land-lot number address to this then it generate well formed postal address.

https://www.epost.go.kr/popup/newaddressintro.html

## Installation

Add your Daum local api key to your .zshrc or your own shell config file for run test.

export DAUM_API_KEY=6afa101412f005d4a16f14c50

Add this line to your application's Gemfile:

```ruby
gem 'korea_postal_address'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install korea_postal_address

## Usage

```ruby
require 'postal_address'

postall_address = PostalAddress.new('input your key')
```

## Contributing

Bug reports and pull requests are welcome.

## License

MIT
