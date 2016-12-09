#!/bin/bash

set -e
set -x

box box.rb
docker push xena/bncadmin

hyper rm -f bncadmin ||:
hyper pull xena/bncadmin
hyper run --name bncadmin -dit --size s2 --env-file .env xena/bncadmin
