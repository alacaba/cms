Running the app
=============

1.) Manual backend and frontend setup
2.) Using Docker (might use a lot of disk storage and might use a bit of bandwidth because of container images)

Manual Setup
-----------------

**Backend :**
**Note*: Before running these commands make sure to supply the correct credentials on database.yml*

**Database setup**
```
$ cd oozou/cms
$ bundle install
$ bundle exec rails db:setup
$ bundle exec rails db:migrate
```

**Running the seed**
```$ bundle exec rails db:seed```

** Start the workers**
```$ bundle exec rails jobs:work```

**Start up the server**

```$ bundle exec rails server```


**Frontend: **


**Install dependencies and start the server**
```
$ cd oozou/cms-frontend
$ cd npm install
$ npm run serve
```

Docker
---------

**building and running the services**

**install frontend dependencies**
```
$ cd oozou/cms-frontend; npm install 
```

Note

To avoid conflict on running the docker build, I suggest to turn off postgres on host temporarily.

```
$ docker-compose build
$ docker-compose up
```

**start the worker**

```$ docker exec -d oozou_backend_1 bin/rails jobs:work```

**logging in to the rails container**

```$ docker exec -it oozou_backend_1 bash```

**shutting down**
```$ docker compose down```


