#!/bin/sh
set -e

sh ./dockerhub/build.sh
sh ./dockerhub/push.sh
npm run infra
heroku git:remote -a ${HEROKU_APP_NAME}-staging
git push heroku master
npm run test:integration