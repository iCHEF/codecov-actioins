#!/bin/bash

echo "run script"

curl -s https://codecov.io/bash > codecov;
VERSION=$(grep 'VERSION=\"[0-9\.]*\"' codecov | cut -d'"' -f2);
VERSION=1.11.0
echo $VERSION

for i in 1 256 512
do
RESULT=$(shasum -a $i -c <(curl -s "https://raw.githubusercontent.com/codecov/codecov-bash/${VERSION}/SHA${i}SUM" | head -n 1))
  if [[ ${RESULT} == "codecov: OK" ]]
  then
    echo "success"
    bash <(curl -s https://codecov.io/bash) -f "./coverage/cobertura-coverage.xml"
  fi
done
rm codecov

echo "end"
