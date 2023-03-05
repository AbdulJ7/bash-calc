#!/usr/bin/bash
self_update() {
  CWD=`pwd`

for d in `find $CWD -name ".git" -type d -maxdepth 2`;
do
    REPO_FOUND=true
    cd $d/..
    PROJECT_DIR=`pwd`
    REMOTE_NAME=`git remote`
    DEFAULT_BRANCH=`git remote show ${REMOTE_NAME} | sed -n '/HEAD branch/s/.*: //p'`
    CURRENT_BRANCH=`git branch --show-current`
    if [ "$DEFAULT_BRANCH" == "$CURRENT_BRANCH" ]; then
      echo "Attempting to sync pull ${PROJECT_DIR}"
      git pull
    else
      if [ -z "$DEFAULT_BRANCH" ]
      then
        echo "Unable to fetch ${PROJECT_DIR}. Cannot determine default branch"
        # too lazy to test, maybe we could try main or master and just handle the error
      else
        echo "Attempting to sync fetch ${PROJECT_DIR}"
        git fetch $REMOTE_NAME $DEFAULT_BRANCH:$DEFAULT_BRANCH
      fi
    fi
done

if [ "true" != "$REPO_FOUND" ]; then
  echo "No repo in current directory. Nothing updated"
fi
}

main() {
   echo -e "Enter 1st Number:\n"
   read n1
   echo -e "Enter 2nd Number:\n"
   read n2
   add=$(($n1+$n2))
   echo -e "Addition is $add" 
   top
   main
}

for arg in "$@"; do
  if [[ "$arg" = -u ]] || [[ "$arg" = --upgrade ]]; then
    ARG_INSTALL_REQUIREMENTS=true
  fi
done


if [[ "$ARG_INSTALL_REQUIREMENTS" = true ]]; then
  self_update
fi

self_update
main
