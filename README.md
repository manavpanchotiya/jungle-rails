# Jungle

A mini e-commerce application built with Rails 6.1.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and `bin/rails db:seed` to seed 
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe


## Screenshots
### Home Page
!["Screenshot of Home Page"](https://github.com/manavpanchotiya/jungle-rails/blob/master/docs/home_page.png)
### Sold Out Plant
!["Screenshot of Sold out plant"](https://github.com/manavpanchotiya/jungle-rails/blob/master/docs/sold_out_plant.png)
### Empty Cart
!["Screenshot of Empty Cart"](https://github.com/manavpanchotiya/jungle-rails/blob/master/docs/empty_cart.png)
### Cart Checkout
!["Screenshot of Cart Checkout"](https://github.com/manavpanchotiya/jungle-rails/blob/master/docs/cart_checkout.png)
### Order Confirmation
!["Screenshot of Order Confirmation"](https://github.com/manavpanchotiya/jungle-rails/blob/master/docs/order_confirmation.png)
### Admin Dashboard
!["Screenshot of Admin Dashboard"](https://github.com/manavpanchotiya/jungle-rails/blob/master/docs/admin_dashboard.png)
### Admin Products
!["Screenshot of Admin Products"](https://github.com/manavpanchotiya/jungle-rails/blob/master/docs/admin_all_products.png)
### Admin Categories
!["Screenshot of Admin Categories"](https://github.com/manavpanchotiya/jungle-rails/blob/master/docs/admin_all_categories.png)