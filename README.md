# README

This is a basic e-commerce web application in Ruby on Rails that includes the following functionalities:
* A user is able to create an account and log in, or login via Google Omniauth.
* A user is able to view categories and products, add/remove products to/from cart.
* A user can view current cart, increase/decrease item quantity, remove item or empty the cart.
* A user can be assigned an admin role to create, add and update categories and products.


* A note on Google Omniauth - you will need to get your own API key at (https://code.google.com/apis/console/) to use this functionality. Note the Client ID and the Client Secret. For more details, read [Google docs:](https://developers.google.com/accounts/docs/OAuth2).



Here's a quick guide to get you started:


* Clone the repository
```
$ git clone
```

* Install required gems
```
$ bundle install
```

* Create and configure the database
```
$ rails db:migrate
```

* Create and configure the database
```
$ rails db:migrate
```

* Seed the database
```
$ rails db:seed
```

* Run the server
```
$ rails s
```

* Type this script into the browser
```
$ localhost:3000/
```

### LICENSE

[MIT LICENSE](https://github.com/redebron20/mumshie-online-store/blob/master/LICENSE)