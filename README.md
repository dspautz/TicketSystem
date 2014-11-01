# Angular Rails Ticket*System

Example application to create Issue report tickets for customers and to manage tickets by staffs. 

## Requirements

### 1. Install Node and dependencies

```
$ sudo apt-get install nodejs
$ sudo apt-get install npm
$ npm install -g bower
$ npm install -g cucumber

```

### 2. Ruby bundle and bower task

```
$ bundle install
$ rake bower:install
```

### 3. Instantiate Database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```


### 4. Configure Mailer

```
config/environments/*.rb
```

```
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    address:              'smtp.example.com',
    port:                 587,
    domain:               '@example.com',
    user_name:            'example@domain.com',
    password:             '****',
    authentication:       'plain',
    enable_starttls_auto: true,
    return_response: true
  }
  config.action_mailer.default_options = {from: 'example@domain.com'}
  
  #config.action_mailer.delivery_method = :sendmail
  # Defaults to:
  # config.action_mailer.sendmail_settings = {
  #   location: '/usr/sbin/sendmail',
  #   arguments: '-i -t'
  # }
  #config.action_mailer.perform_deliveries = true
  #config.action_mailer.raise_delivery_errors = true
```

## Most important used technology

* Angular.js
* Cucumber
* Rails 4.1
* Twitter Bootstrap
* Angular Bootstrap UI
* Rspec
* Jasmin Javascript
* Teaspoon
* Haml
* Angular Rails*Route
* Angular Templates
* Capybara
* Selenium Webdriver
* Bower
* Node.js

## Default User

Username: admin

Password: password

## ToDo's

* Delete Ticket requests
* Encrypted user passwords
* Staff management
* Roles management
* Status management
* Dialogs and output information
* Cucumber Tests
* Logging and Exception handling
* Documentation
* Searchmask redesign with AND/OR syntax
* Redesign Mail-content
* Logout and session invalidation
* DRY for app/asssets/templates/tickets/index.html.erb
* Session management and Security
* Change Ticket Owner automatically on retry

## License
Copyright (c) 2014 [David Spautz]

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


## Authors & contributors

* David Spautz <d.spautz@mail.com>