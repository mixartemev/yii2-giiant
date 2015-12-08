#!/usr/bin/env bash

set -e

export CI_APP_VOLUME=..
DOCKER_COMPOSE="docker-compose --x-networking"

docker exec tests_php_1 sh -c "\
    codecept run -c /app/vendor/schmunk42/yii2-giiant/codeception.yml cli prod/base && \
    codecept run -c /app/vendor/schmunk42/yii2-giiant/codeception.yml cli prod/${GIIANT_TEST_DB} && \
    codecept run -c /app/vendor/schmunk42/yii2-giiant/codeception.yml -vv acceptance && \
    codecept run -c /app/vendor/schmunk42/yii2-giiant/codeception.yml functional
    "
