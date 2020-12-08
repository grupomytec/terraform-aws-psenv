#!/bin/sh

# Exit if any of the intermediate steps fail
set -e

if [ -z $1 ]
then
  echo '{"json":{"Parameters":[]}}'
  exit 0
fi

raw_json=$(aws ssm get-parameters-by-path --with-decryption --path $1)

# Return the JSON stringified
# For more informations see the issue bellow:
# <https://github.com/hashicorp/terraform-provider-external/issues/13>
encoded_json=$(echo $raw_json | sed 's/\\"/\\\\\\\\"/g' | sed 's/"/\\"/g')
echo "{\"json\": \"$encoded_json\"}"
