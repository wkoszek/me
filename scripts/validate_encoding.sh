#!/bin/sh

for FILE in $*; do
  iconv -f UTF-8 $FILE > /dev/null
  if [ $? -ne 0 ]; then
    echo $FILE is wrong
  fi
done
