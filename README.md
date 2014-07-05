# IdobataHook

A client for Idobata's Generic Hook

[![Build Status](https://travis-ci.org/fukayatsu/idobata_hook.svg?branch=master)](https://travis-ci.org/fukayatsu/idobata_hook)
[![Coverage Status](https://img.shields.io/coveralls/fukayatsu/idobata_hook.svg)](https://coveralls.io/r/fukayatsu/idobata_hook)
[![Code Climate](https://codeclimate.com/github/fukayatsu/idobata_hook.png)](https://codeclimate.com/github/fukayatsu/idobata_hook)

## Installation

Add this line to your application's Gemfile:

    gem 'idobata_hook'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idobata_hook

## Usage

```ruby
client = IdobataHook::Client.new("https://idobata.io/hook/generic/***")
client.send('hello, world')
client.send("<h1>hi</h1>", format: :html)
client.send('Look at this', image_path: '/path/to/image.png')
client.send([
  {'label-success' => 'build passing!' }, #=> <span class="label label-success">build passing!</span>
  { badge: '123' },                       #=> <span class="badge">123</span>
  { emoji: 'smile'},                      #=> <img class="emoji" alt=":smile:" src="/images/emoji/smile.png" height="20" width="20">
  "Foooo!",                               #=> Foooo!
  { fa: 'camera-retro' },                 #=> <i class="fa fa-camera-retro"></i>
])
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/idobata_hook/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
