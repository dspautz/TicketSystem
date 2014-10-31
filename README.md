# Angular Rails Ticket-System

Example application to create Issue report tickets for customers and to manage tickets by staffs. 

## Requirements

### 1. Install Node and dependencies

```
$ sudo apt-get install nodejs

$ sudo apt-get install npm

$ npm install -g bower

$ npm install -g cucumber

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
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    address:              'smtp.web.de',
    port:                 587,
    domain:               'domain.com',
    user_name:            'example@domain.com',
    password:             '****',
    authentication:       'plain',
    enable_starttls_auto: true,
    return_response: true
  }
  
  #config.action_mailer.delivery_method = :sendmail
  # Defaults to:
  # config.action_mailer.sendmail_settings = {
  #   location: '/usr/sbin/sendmail',
  #   arguments: '-i -t'
  # }
  #config.action_mailer.perform_deliveries = true
  #config.action_mailer.raise_delivery_errors = true
  #config.action_mailer.default_options = {from: 'example@domain.com'}
```

## Default User

Username: admin
Password: password