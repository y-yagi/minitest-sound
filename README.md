# Minitest::Sound

minitest-sound plays sound when test finished.

## Requirements

* `mpg123`
* `minitest ~> 5.0`

## Installation

Add this line to your application's Gemfile:

    gem 'minitest-sound', github: 'y-yagi/minitest-sound'

And then execute:

    $ bundle

## Usage

```ruby
require 'minitest/sound'

Minitest::Sound.success = 'xxx.mp3' # Sound file which does play when a test succeeded.
Minitest::Sound.failure = 'xxx.mp3' # Sound file which does play when a test failed.
Minitest::Sound.during_test = 'xxx.mp3' # Sound file which does play during test.
```

## Contributing

1. Fork it ( https://github.com/y-yagi/minitest-sound/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## TODO

* Add test
* Support soundcloud api
