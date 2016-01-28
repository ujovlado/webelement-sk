#!/bin/bash

docker build -t webelement/data ./docker/data

docker build -t webelement/website --build-arg userId=`id -u` --build-arg groupId=`id -g` ./docker/website
