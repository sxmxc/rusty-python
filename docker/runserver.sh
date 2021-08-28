#! /bin/sh
./wait-for-it.sh postgres:5432 -t 60
./wait-for-it.sh elasticsearch:9200 -t 60
./wait-for-it.sh redis:6379 -t 60

bootstrap --config schemas/strapi.json
pgsync --config schemas/strapi.json --daemon
