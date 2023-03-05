#!/usr/bin/bash
self_update() {
# store the current dir
CUR_DIR=~/.local/share/bash-calc

# Let the person running the script know what's going on.
echo -e "\n\033[1mPulling in latest changes...\033[0m\n"

cd $CUR_DIR
   # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # git checkout master;
    git remote prune origin;
    git fetch origin;
    git pull;

    
echo -e "\n\033[32mComplete!\033[0m\n"
}

main() {
   echo -e "Enter 1st Number:\n"
   read n1
   echo -e "Enter 2nd Number:\n"
   read n2
   add=$(($n1+$n2))
   echo -e "Addition is $add" 
   cmatrix
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

main
