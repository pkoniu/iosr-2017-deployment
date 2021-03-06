#!/bin/sh
set -e

sh $(find ~/ | grep iosr-2017-deployment/dockerhub/build.sh)
sh $(find ~/ | grep iosr-2017-deployment/dockerhub/push.sh)
npm run infra
heroku git:remote -a ${HEROKU_APP_NAME}-staging
git push heroku master
npm run test:integration