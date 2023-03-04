#!/usr/bin/bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
SCRIPTNAME="$0"
ARGS="$@"
BRANCH="main"

self_update() {
    cd $SCRIPTPATH
    git fetch

    [ -n $(git diff --name-only origin/$BRANCH | grep $SCRIPTNAME) ] && {
        echo "Found a new version of me, updating myself..."
        git pull --force
        git checkout $BRANCH
        git pull --force
        echo "Running the new version..."
        exec "$SCRIPTNAME" "$@"

        # Now exit this old instance
        exit 1
    }
    echo "Already the latest version."
}

main() {
   echo -e "Enter 1st Number:\n"
   read n1
   echo -e "Enter 2nd Number:\n"
   read n2
   add=$(($n1+$n2))
   echo -e "Addition is $add"  
}

self_update
mian
