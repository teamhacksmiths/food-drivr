Hackathon for Hunger Backend

## Getting Started

### Installing with Docker
This app was setup using the heroku docker box.  The build process is automated using docker-compose.

Install the Docker toolbox and then run
```
docker-compose up web
```

To open the running app, run
```
open "http://$(docker-machine ip default):8080"
```

Take a [look at these instructions](https://blog.codeship.com/deploying-docker-rails-app/) if you have any issues.

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
