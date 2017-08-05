#!/bin/bash

docker-compose run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  aws --region eu-central-1 s3 rm s3://www.webelement.sk --recursive

docker-compose run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  aws --region eu-central-1 s3 cp _build s3://www.webelement.sk --recursive --acl "public-read" --cache-control "max-age=600"

docker-compose run --rm \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  aws --region eu-central-1 s3api put-bucket-website --bucket www.webelement.sk --website-configuration file://provisioning/website.json
