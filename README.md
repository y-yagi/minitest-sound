# Minitest::Sound

[![Build Status](https://travis-ci.org/y-yagi/minitest-sound.svg?branch=master)](https://travis-ci.org/y-yagi/minitest-sound)
[![Gem Version](https://badge.fury.io/rb/minitest-sound.svg)](http://badge.fury.io/rb/minitest-sound)

minitest-sound plays sound when test finished.

## Requirements

* `mpg123`
* `minitest ~> 5.0`

## Installation

Add this line to your application's Gemfile:

    gem 'minitest-sound'

And then execute:

    $ bundle

## Usage

```ruby
require 'minitest/sound'

Minitest::Sound.success = '/aaa/bbb/xxx.mp3' # Sound file which does play when a test succeeded.
Minitest::Sound.failure = '/aaa/bbb/xxx.mp3' # Sound file which does play when a test failed.
Minitest::Sound.during_test = '/aaa/bbb/xxx.mp3' # Sound file which does play during test.
```

### When use with `minitest-reporters`

When use it with `minitest-reporters`, it is necessary to set `Minitest::Sound::Reporter` in `Minitest::Reporters.use!`

Example:

```ruby
require 'minitest/sound/reporter'


Minitest::Sound.success = '/aaa/bbb/xxx.mp3'
Minitest::Sound.failure = '/aaa/bbb/xxx.mp3'
Minitest::Sound.during_test = '/aaa/bbb/xxx.mp3'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Sound::Reporter.new]
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
