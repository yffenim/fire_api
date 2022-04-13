# Fire API, Version 1

### A Front-End Agnostic API for tracking wakefullness throughout the day. 

That which is not measured, cannot be managed. Get to know your circadian rhythmn.

Built on Rails 6.1.0.4 so that a database migration to MongoDB would be water off a duck's back. 

Also using:
https://github.com/activeadmin/activeadmin
https://github.com/waiting-for-dev/devise-jwt

### Front-End Clients

Native: https://github.com/yffenim/fire_native

Browser: TBD

### Local Usage

`bundle install`
`rails db:migrate db:seed`
`rails s` 

### Online Interaction

https://limitless-citadel-71686.herokuapp.com/ 

If you need to reseed the database:

`heroku rake db:seed`

If you need to make model changes to the database:

`heroku restart`

`heroku pg:reset DATABASE_URL`

`heroku rake db:migrate db:seed`

# Docs -- For Later Versions - TBD

### Active Admin Users - CRUD, Authentication, Data Visualization

Default user login: "admin@example.com" "password"

### Users -- CRUD, Authentication, Data Visualization

### Alerts -- API-interaction

https://limitless-citadel-71686.herokuapp.com/api/alerts
