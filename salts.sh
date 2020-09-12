#!/bin/bash

function get_salt {
  SALTLENGTH=64
  salts=$(
    strings </dev/urandom | while read line; do
            echo $line | tr '\n\t ' $RANDOM:0:1 >> /tmp/.salt.$$
            salt=$(cat /tmp/.salt.$$)
            if [ ${#salt} -ge $SALTLENGTH ]; then
              salt=${salt:0:$SALTLENGTH}
              echo $salt
              break
            fi
    done)
  rm -f /tmp/.salt.$$
}

while [ $(grep -i -c "generateme" .env) -gt 0 ]; do
  get_salt
  echo $salts
  if [[ $salts == *'&'* ]]; then
    echo 'HAS &'
    continue
  fi
  if [[ $salts == *'\'* ]]; then
    echo 'HAS \'
    continue
  fi
  # sed -z -i "0,/generateme/s//$salts/" .env
  awk -v s=$salts 'NR==1,/generateme/{sub(/generateme/, s)} 1' .env > .env.temp
  mv .env.temp .env
done
