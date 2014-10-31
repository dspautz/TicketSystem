# Angular Rails Ticket*System

Example application to create Issue report tickets for customers and to manage tickets by staffs. 

## Requirements

### 1. Install Node and dependencies

```
$ sudo apt*get install nodejs
$ sudo apt*get install npm
$ npm install *g bower
$ npm install *g cucumber

```

### 2. Runy bundle and bower task

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
  config.action*mailer.delivery*method = :smtp
  config.action*mailer.perform*deliveries = true
  config.action*mailer.raise*delivery*errors = true
  config.action*mailer.smtp*settings = {
    address:              'smtp.example.com',
    port:                 587,
    domain:               '@example.com',
    user*name:            'example@domain.com',
    password:             '****',
    authentication:       'plain',
    enable*starttls*auto: true,
    return*response: true
  }
  config.action*mailer.default*options = {from: 'example@domain.com'}
  
  #config.action*mailer.delivery*method = :sendmail
  # Defaults to:
  # config.action*mailer.sendmail*settings = {
  #   location: '/usr/sbin/sendmail',
  #   arguments: '*i *t'
  # }
  #config.action*mailer.perform*deliveries = true
  #config.action*mailer.raise*delivery*errors = true
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

* Dynamic Ticket links
* Create/Update/Delete Ticket requests
* Encrypted user passwords
* Staff management
* General Routing
* Dialogs and output information
* Cucumber Tests
* Logging and Exception handling
* Documentation
* Searchmask redesign with AND/OR syntax
* Redesign Mail*content
* Format Date output
* HAML formatting

## License

No License at the moment

## Authors & contributors

* David Spautz <d.spautz@mail.com>