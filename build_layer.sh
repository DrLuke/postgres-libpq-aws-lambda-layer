#!/usr/bin/env bash

set -e
mkdir -p pg-layer/lib

# Copy lib files from postgres to lib directory
cp postgresql/tmp_install/usr/local/pgsql/lib/libpq.so* pg-layer/lib

# Zip the layer
cd pg-layer
zip aws-libpg-layer.zip * -r

# Move to project root
cd ..
mv pg-layer/aws-libpg-layer.zip .
rm -r pg-layer