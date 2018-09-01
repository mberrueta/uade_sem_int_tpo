# Ekis API

Restful backend application for Ekis project

## Requirements

- Docker
- Docker Compose
- Ruby (v2.3.6)

## Install

```shell
git clone https://github.com/mberrueta/uade_sem_int_tpo.git
cd uade_sem_int_tpo/api
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
bundle install # intall the libraries
```


