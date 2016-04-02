Hackathon for Hunger Backend

## Getting Started

### Installing
Start with running
```
bundle install
```
Followed by
```
rake db:migrate
rake db:seed
```
to setup the database schema and provide the app with seed data.

The default username and password is:
* __User__: admin@example.com
* __Password__: password

## Deployment
Will be deployed to heroku.  The gemfile include pg and the needed heroku dependencies.  Push to heroku and run
```
heroku run rake db:migrate
```
in order to setup the database.

If processes are needed, they will need to be setup in the Procfile.

## Built With
Ruby on Rails

## Authors

* **Ryan Collins**
* **David Harris**
* **Peter James Bernante**
* **Kevin Windisch**
## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.  Anyone anywhere can feel free to clone this repo to use for the purposes of streamlining their food donations.

## Acknowledgments
Thanks to all the wonderful participants!
