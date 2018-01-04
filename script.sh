#!/bin/sh
set -e

pwd
sh ${DEPLOYMENT_SCRIPTS_PATH}/dockerhub/build.sh
sh ${DEPLOYMENT_SCRIPTS_PATH}/dockerhub/push.sh
npm run infra
heroku git:remote -a ${HEROKU_APP_NAME}-staging
git push heroku master
npm run test:integration