#!/bin/bash

# Description: SIT - Svn with gIT extensions, test suite
# Author:      jlechnar
# Licence:     GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Source:      https://github.com/jlechnar/sit

#set -x
set -e

source ./scripts/setup.sh
source ./scripts/helper_functions.sh
source ./sit_cmd.sh

setup_path "${PREFIX_EXAMPLE_PATH}_diff_single" "Setup diff"

source ./scripts/setup_env2.sh
./scripts/setup_server2.sh
./scripts/setup_user2.sh

cd user1/

########################
echo "file1" > file1
echo "file2" > file2
echo "file3" > file3

########################
execute "$SIT add * .sitconfig"
execute "$SIT commit . -m 'test'"

echo "file_changed" > file1
echo "file_changed2" > file2
svn rm file3

execute "svn status"
execute "$SIT diff -t diff"
#execute "$SIT diff -v --debug"

