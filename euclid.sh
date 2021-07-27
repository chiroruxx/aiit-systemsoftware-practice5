#!/bin/bash

if [ $# -ne 2 ]; then
  echo 'usage: euclid.sh arg1 arg2'
  exit 1
fi

if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "usage: arg1 should be a natural number."
  exit 1
fi

if ! [[ "$2" =~ ^[0-9]+$ ]]; then
  echo "usage: arg2 should be a natural number."
  exit 1
fi

if [ "$1" -eq 0 ]; then
  echo "usage: cannot assign zero to arg1"
  exit 1
fi

if [ "$2" -eq 0 ]; then
  echo "usage: cannot assign zero to arg2"
  exit 1
fi

arg1=$1
arg2=$2
tmp=0

while [ "$arg2" -ne 0 ]; do
  tmp=$(( arg1 % arg2 ))
  arg1=$arg2
  arg2=$tmp
done

echo "$arg1"

