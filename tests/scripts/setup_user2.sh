#!/bin/bash

# Description: SIT - Svn with gIT extensions, test suite
# Author:      jlechnar
# Licence:     GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Source:      https://github.com/jlechnar/sit

#set -x

source ./scripts/helper_functions.sh
source ./scripts/setup_env2.sh

setup_path "user1" "create local / sandbox repository for user1"

REPO_PATH=`realpath ../server1/repo`

# initialize local repository
execute "svn checkout file://$REPO_PATH/$PROJECT_PATH/trunk ." ""


