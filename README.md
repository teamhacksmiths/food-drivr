![Hacksmiths Logo](https://github.com/teamhacksmiths/food-drivr-backend/blob/master/.github/assets/hacksmiths-logo.svg)

# Food Drivr - Made with ❤️ by [Hacksmiths](http://hacksmiths.io)

## About
The [Food Drivr](http://fooddrivr.com) web and mobile app serves to make it dead simple to donate edible food to the hungry.  Open the app, press a button and a driver will come pick it up, bringing it to the less fortunate.

The [Hacksmiths](http://hacksmiths.io) are working with a charitable organization called the Waste Not Food Taxi in an effort to facilitate their philanthropic work through the creation of software.  The Waste Not Food Taxi provides a service to shuttle donated food in the city of Portland.

## Technical Info
[Rails API](https://github.com/teamhacksmiths/food-drivr-backend)
[iOS Mobile App](https://github.com/teamhacksmiths/food-drivr-ios)
[React Front End](https://github.com/teamhacksmiths/food-drivr-frontend)

## Links
[Asana Project Management / Ticketing](https://app.asana.com/0/94684923468934)
[Specifications](https://docs.google.com/document/d/1JCQDv0QcZB6NGKWcgWc3PVjYTCLtYUbnEOlyPy5f7ZA/edit?usp=sharing)
[API Documentation](http://teamhacksmiths.github.io/food-drivr-api-documentation/)
[Entity Relationship Diagrams](https://www.lucidchart.com/documents/view/04f97352-911c-45c8-8fd2-cf457c40f7d2)

## Getting Started

Note: for instructions for the iOS App and ReactJS Front End, please see the README.md located in their respective repositories (linked above).

### Installing with Docker
This app was setup using the Heroku docker box.  The build process is automated using docker-compose.

Install the Docker toolbox and then run
```
docker-compose up
```

To create and migrate the database, run
```
docker-compose run app rake db:setup
```
which effectively runs these commands within the app container.

To open the running app, run
```
open "http://$(docker-machine ip default):3000"
```

### Migrate
You will need to periodically migrate and seed the db when changes have been made.  Migrations make changes to the db simple.
Simply run:
```
docker-compose run app rake db:migrate
```
When new migrations have been added.

### Seed
To seed the database, for now, you will need to reset the database and then run the setup.
```
rake db:reset
rake db:setup
```

### Admin Interface
Admin interface is viewable from /admin
using default credentials of
User: admin@example.com
Password: password

Documentation for active admin can be found [at the following link]
(https://github.com/activeadmin/activeadmin/blob/master/docs/0-installation.md)

Take a [look at these instructions](http://blog.codeship.com/running-rails-development-environment-docker/) for getting a development environment setup.  

### Manual Installation
Manual installation can be done as follows

Start with running
```
bundle install
```
The app is setup to use postgresql in all environments.  You will need to manually install and configure PGSQL, or will need to use sqllite and change the configuration in the Gemfile and config.rb while in development.

Followed by
```
rake db:migrate
```
to setup the database schema.  

## Deployment
The app will be deployed to Heroku.  Instructions for doing so can be found [at this link] (https://blog.codeship.com/deploying-docker-rails-app/).

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
