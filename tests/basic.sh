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

setup_path "${PREFIX_EXAMPLE_PATH}_basic" "Setup basic"

./scripts/setup_server1.sh
./scripts/setup_user1.sh

cd user1/

######################
execute "$SIT status" "show status"
execute "$SIT branches" "show branches"
execute "$SIT branch" "show branch"

######################
touch t
execute "$SIT add t .sitconfig"
execute "$SIT commit -m \"test\""
execute "$SIT update"
execute "$SIT status"

######################
execute "$SIT branch testbranch -m \"testbranch\""
execute "$SIT branch testbranch2 -a"

execute "$SIT checkout testbranch2"

touch t2
execute "$SIT add t2"
execute "$SIT commit -m \"testbranch\""

touch t3
execute "$SIT update"
execute "$SIT add t3"
execute "$SIT stash push 'test' -a"
execute "$SIT status"

execute "$SIT branches"

execute "$SIT stash list"

touch t4
execute "$SIT add t4"
execute "$SIT stash push 'test2' -a"

#execute "$SIT stash apply 'test'"
execute "$SIT stash list"
execute "$SIT stash pop 'test'"
execute "$SIT status"

execute "svn ls ^/stashes"

#execute "$SIT diff trunk -t diff -v --debug "
#execute "$SIT diff trunk -t meld -v --debug "
#execute "$SIT diff trunk -v --debug"
execute "$SIT diff trunk -t diff"
execute "$SIT diff -t diff"
execute "$SIT diff trunk testbranch2 -t diff"

#execute "pwd"
#execute "$SIT diff trunk -t diff -v --debug"
#
#execute "$SIT branch"

execute "$SIT branches"
