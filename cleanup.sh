#!/bin/sh

find . -type f -name "*.html" -print0 | xargs -0 perl -pi -e 's/ +$//'
find . -type f -name "*.css" -print0 | xargs -0 perl -pi -e 's/ +$//'
find . -type f -name "*.erb" -print0 | xargs -0 perl -pi -e 's/ +$//'
find . -type f -name "*.md" -print0 | xargs -0 perl -pi -e 's/ +$//'
