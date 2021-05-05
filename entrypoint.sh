#!/bin/bash

echo "run script"

curl -s https://codecov.io/bash > codecov;
VERSION=$(grep 'VERSION=\"[0-9\.]*\"' codecov | cut -d'"' -f2);
echo $VERSION
for i in 1 256 512
do
shasum -a $i -c <(curl -s "https://raw.githubusercontent.com/codecov/codecov-bash/${VERSION}/SHA${i}SUM" | head -n 1)
done
rm codecov

echo "end"
