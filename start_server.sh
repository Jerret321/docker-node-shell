#!/bin/bash
docker build -t jt/blog .
docker run -p 8360:8360 -v $PWD/blog:/var/www/blog -idt jt/blog
