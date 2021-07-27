#!/bin/bash

function run_test() {
  if [ $? -eq "$1" ]; then
    return "$2"
  else
    return 1
  fi
}

total=0

echo "Test of argument counts."
if ! /bin/bash euclid.sh >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi
if ! /bin/bash euclid.sh 1 >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi
if ! /bin/bash euclid.sh 1 2 3 >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi

echo "Test of argument1 type."
if ! /bin/bash euclid.sh a 1 >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi

if ! /bin/bash euclid.sh -1 1 >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi

if ! /bin/bash euclid.sh 0 1 >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi

echo "Test of argument2 type."
if ! /bin/bash euclid.sh 1 a >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi

if ! /bin/bash euclid.sh 1 -1 >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi

if ! /bin/bash euclid.sh 1 0 >/dev/null; then
  echo "OK"
else
  echo "NG"
  total=1
fi

echo "Test of result."
result=$(/bin/bash euclid.sh 20 100)
if [ "$result" -eq 20 ]; then
  echo "OK"
else
  echo "NG"
  total=1
fi

result=$(/bin/bash euclid.sh 20 20)
if [ "$result" -eq 20 ]; then
  echo "OK"
else
  echo "NG"
  total=1
fi

result=$(/bin/bash euclid.sh 60 48)
if [ "$result" -eq 12 ]; then
  echo "OK"
else
  echo "NG"
  total=1
fi

exit $total
