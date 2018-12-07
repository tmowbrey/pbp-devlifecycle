#!/bin/bash
  openssl aes-256-cbc -K $encrypted_e92249cedda5_key -iv $encrypted_e92249cedda5_iv
   in assets/server.key.enc -out assets/server.key -d
  export SFDX_AUTOUPDATE_DISABLE=false
  export SFDX_USE_GENERIC_UNIX_KEYCHAIN=true
  export SFDX_DOMAIN_RETRY=300
  export SFDX_DISABLE_APP_HUB=true
  export SFDX_LOG_LEVEL=DEBUG
  cd ..
  mkdir sfdx
  wget -qO- $URL | tar xJ -C sfdx --strip-components 1
  "./sfdx/install"
  export PATH=./sfdx/$(pwd):$PATH
  sfdx --version
  sfdx plugins --core

if [[ $TRAVIS_BRANCH == 'master' ]]
  sfdx force:auth:jwt:grant --clientid $CONSUMERKEY --jwtkeyfile assets/server.key --username $USERNAME --setdefaultdevhubusername -a HubOrg
else if [[ $TRAVIS_BRANCH == 'develop' ]]
  sfdx force:auth:jwt:grant --clientid 3MVG9bx.kiqxiA6ZQ2DaJfMYCSI7O0Z7zCuIpZSLwUch5rxjdcm8BabwnVSCETG2l2ZKGQKhii5J_MrnhihwU --jwtkeyfile /mnt/c/Users/tyler.mowbrey.2D/IdeaProjects/certificates/server.key --username pbp@devlifecycle.com.develop --setdefaultdevhubusername --setalias Develop --instanceurl https://test.salesforce.com
fi
