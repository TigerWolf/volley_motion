# VolleyMotion

A gem to add the Volley Library to your RubyMotion Android Project.

> Volley is an HTTP library that makes networking for Android apps easier and most importantly, faster.

Currently supports GET, POST of Objects and Arrays as well as Basic Auth. Please submit a github issue if a feature you want to use it not supported, more than happy to look into it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'volley_motion'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install volley_motion

## Setup

Inside a RubyMotion Android project

`motion create my_project --template=android`

1. Ensure your project is using Bundler if you started your project with an old version of RubyMotion:

  ```ruby
  begin
  require 'bundler'
  Bundler.require
  rescue LoadError
  end
  ```

2. Ensure you have the internet permission in your Rakefile

  ```
  app.permissions = [:internet]
  ```

3. Add this inside the app in your rakefile

  ```
  app.volley
  ```

  Adding this will add some files to your project that are required.

## Usage

Inside of your activity create a request like the following example:

  ```ruby
  def fetch_list
    url = "http://example.com/api/list"
    success_listener = VolleyMotion::RequestListener.new(self, List)
    error_listener = VolleyMotion::ErrorListener.new
    get = VolleyMotion::JsonArrayRequest.new(url, success_listener, error_listener)
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

The Library also supports Basic Authentication, for example:

  ```ruby
  success_listener = VolleyMotion::RequestListener.new(self, Barcode)
  error_listener = VolleyMotion::ErrorListener.new(self)

  params = {}
  params[Java::Lang::String.new("barcode")] = Java::Lang::String.new(@barcode)

  post = VolleyMotion::PostAuthRequest.new(url, params, success_listener, error_listener)
  post.username = @username
  post.password = @password
  VolleyMotion::RequestQueue.build(self).add(get)
  ```

See https://github.com/TigerWolf/volley_example for a working example.

## Contributing

1. Fork it ( https://github.com/TigerWolf/volley_motion/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
