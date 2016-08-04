# Kipalog

Ruby wrapper for Kipalog API

Original documentation see at: [https://github.com/Kipalog/Kipalog-API-Doc](https://github.com/Kipalog/Kipalog-API-Doc)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kipalog'
```

And then execute:

```bash
$ bundle install
```

## Usage

### IMPORTANT: Configure your API token

```ruby
Kipalog.configure do |config|
  config.api_key = 'key-obtained-from-kipalog'
end
```

If you're using *Rails*, you might want to consider putting it in `config/initializers/kipalog.rb`

### `Kipalog::Post.preview`

```ruby
markdown = %{
  ### FOO
  * Item A
  * Item B
  * Item C
}
Kipalog::Post.preview(markdown)
```

### `Kipalog::Post.create`


```ruby
markdown = %{
  ### FOO
  * Item A
  * Item B
  * Item C
}

data = {
  title: 'Hello World',
  content: markdown,
  tag: 'foo,bar',
  status: 'published' # or "draft"
}
Kipalog::Post.create(data)
```

### `Kipalog::Post.newest`

Get all latest posts on Kipalog.com

```ruby
Kipalog::Post.newest
```

### `Kipalog::Post.hot`

Get all the latest posts on Kipalog.com

```ruby
Kipalog::Post.hot
```

### `Kipalog::Post.bytag`

Fetch all posts by a specific tag name

```ruby
Kipalog::Post.bytag('ruby')
```

## Development

1. Fork this repository.
2. Add your feature as well as your test (in MiniTest).
3. Send us a pull request.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/huynhquancam/kipalog. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

The MIT License (MIT)

Copyright (c) 2016 Cam Huynh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
