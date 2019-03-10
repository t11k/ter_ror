# TerRor

TerRor is a simple gem that helps to organize and translate Rails API errors.

## Usage
TerRor requires two files to work.
Firs one: `config/error_messages.yml` is a simple list of available error codes with corresponding short messages.

```ruby
1001: "Name can't be blank"
1002: "Email already taken"
1003: "Phone format is invalid"

2001: "Weapon must be one of: Whire, Firearm."
2002: "Serial number must be in format: '1111-2222-3333-4444-DE'."
```

The second one: `config/error_codes.yml` is a mapping of model errors into error codes.

```ruby
terrorist:
  name_blank: 1001
  email_taken: 1002
  phone_invalid: 1003
weapon:
  kind_inclusion: 2001
  serial_number_invalid: 2002
```

You can configure TerRor to use other locations or names of these files like this:

```ruby
  TerRor.configure do |config|
    config.messages_filepath = "config/api_error_messages.yml"
    config.codes_filepath = "config/api_error_codes.yml"
  end
```

By default `Terror::Model` module is mixed into `ApplicationRecord`. You must include it yourself in classes that do not inherit from `ApplicationRecord`.
This module adds `terrors` method to models which returns list of object's errors translated into codes in the following format:

```ruby
  [
    {
      "code" => 1001,
      "message" =>  "Name can't be blank"
    }, {
      "code" => 1002,
      "message" => "Email already taken"
    }, {
      "code" => 1003,
      "message" => "Phone format is invalid"
    }
  ]
```

There is also a `Terror::Controller` module mixed into `ApplicationController` which gives you a convenient helper to render errors JSON:

```ruby
class SomeController < ApplicationController
  def create
    if new_object.save
      head :no_content
    else
      render_terrors(new_object)
    end
  end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ter_ror'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ter_ror
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
