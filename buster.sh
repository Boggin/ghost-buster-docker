#!/bin/bash
buster generate --domain=http://ghost:2368
#curl -o static/rss/index.html http://ghost:2368/rss/

echo "Fixing links to https"
#find static -name *.html -type f -exec sed -i -e 's#http://localhost:2368#https://stefanscherer.github.io#g' {} \;

echo "Removing index.html from links"
find static -name *.html -type f -exec sed -i -e 's#/index.html#/#g' {} \;

if [ "$1" == "--deploy" ]; then
  buster deploy
fi
