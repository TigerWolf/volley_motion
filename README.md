# VolleyMotion

A gem to add the Volley Library to your RubyMotion Android Project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'volley_motion'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install volley_motion

Note: There appears to be some issues with the gem and downloading from RubyGems.

If you have any problems, try using:

    $ bundle install --path vendor/bundle

## Setup

Inside a RubyMotion Android project

`motion create my_project --template=android`

1. Edit the `Rakefile` of your RubyMotion project and add the following require
   lines:

   ```ruby
   require 'rubygems'
   require 'volley_motion'
   ```

2. Ensure you have the internet permission in your rake file

  ```ruby
  app.permissions = [:internet]
  ```

## Usage

Inside of your activity create a request like the following example:

  ```ruby
  def fetch_list
    url = "http://example.com/api/list"
    success_listener = VolleyMotion::RequestListener.new(self, List)
    error_listener = VolleyMotion::ErrorListener.new
    get = VolleyMotion::JsonArrayRequest.build(url, success_listener, error_listener)
    VolleyMotion::RequestQueue.build(self).add(get)
  end
  ```

Create a model (List):

  ```ruby
  class List
    attr_reader :list

    def initialize(json)
      # read your JSON response here for example:
      for i in 0..(json.length-1)
          object = json.get(i)
          # Your code here
      end
    end
  end
  ```

Also add this method to your activity:

  ```ruby
  def update_display(lists)
    # do something with your object here like adding to a ListView
  end
  ```

See https://github.com/TigerWolf/volley_example for a working example.

## Contributing

1. Fork it ( https://github.com/TigerWolf/volley_motion/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
