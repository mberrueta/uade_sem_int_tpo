# Ekis API

Restful backend application for Ekis project

## Requirements

- Docker
- Docker Compose
- Ruby (v2.5.1)

## Install

```shell
git clone https://github.com/mberrueta/uade_sem_int_tpo.git
cd uade_sem_int_tpo/api
bundle install # intall the libraries
docker-compose up # -d to run in detach mode
```

## Db

```shell
# create db
rake db:create
rake db:migrate
rake db:seed

# `rake db:drop` if you want to drop db to re-create

# Enter db console
rails db
# \h for help
# \x for column mode
# \q to quit
```

## Run tests
```
rake
```

## Heroku deploy
```
# in the root git folder `uade_sem_int_tpo/`
heroku login
heroku git:remote -a uade-sem-int-tpo-api
git subtree push --prefix api heroku master
heroku run rake db:migrate db:seed
# server access
heroku run bash

```

## Structure

```
$ tree -d -I tmp

├── app
│   ├── channels
│   │   └── application_cable
│   ├── controllers
│   │   └── concerns
│   ├── jobs
│   ├── mailers
│   ├── models
│   │   └── concerns
│   └── views
│       └── layouts
├── bin
├── config
│   ├── environments
│   ├── initializers
│   └── locales
├── db
│   └── migrate
├── features
│   ├── step_definitions
│   └── support
├── lib
│   └── tasks
├── log
├── public
├── spec
│   ├── controllers
│   ├── factories
│   └── models
├── storage
└── vendor

```
