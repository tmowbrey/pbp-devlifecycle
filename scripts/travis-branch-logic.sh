#!/bin/bash

if [[ $TRAVIS_BRANCH == 'develop' ]]
then
  sfdx force:mdapi:deploy --deploydir ${TRAVIS_BUILD_DIR}/src --targetusername pbp@devlifecycle.com.develop --wait 2
elif [[ $TRAVIS_BRANCH == 'task-featureA' ]]
then
  sfdx force:org:create -v HubOrg -s -f ${TRAVIS_BUILD_DIR}/config/workspace-scratch-def.json -a testScratchOrg --wait 3
  sfdx force:org:display -u testScratchOrg
  sfdx force:source:push -u testScratchOrg
  sfdx force:apex:test:run -u testScratchOrg --wait 10
  sfdx force:org:delete -u testScratchOrg -p
fi
