#!/usr/bin/bash
self_update() {
  # store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

# Find all git repositories and update it to the master latest revision
for i in $(find -L $HOME/.local/share/bash-calc -name ".git" | cut -c 1-); do
    echo "";
    echo -e "\033[33m"+$i+"\033[0m";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # git checkout master;
    git remote prune origin;
    git fetch origin;
    git stash;
    git pull;
    git stash;
    git stash drop;
    
    #lets go back current directory
    cd $CUR_DIR
done
     chmod +x ~/.local/share/bash-calc/calculator.sh
     bash  ~/.local/share/bash-calc/calculator.sh

echo -e "\n\033[32mComplete!\033[0m\n"
}

_help() {
  echo "Usage"
  echo " u | --update) for addition"
  echo " h | --help) for addition"
  echo " a | --add) for addition"
  echo " s | --sub) for addition"
  echo " m | --mul) for addition"
  echo " d | --div) for addition"
  
}

add() {
   echo -e "Enter 1st Number:\n"
   read n1
   echo -e "Enter 2nd Number:\n"
   read n2
   add=$(($n1+$n2))
   echo -e "Addition is $add" 
}


sub() {
   echo -e "Enter 1st Number:\n"
   read n1
   echo -e "Enter 2nd Number:\n"
   read n2
   sub=$(($n1-$n2))
   echo -e "Subtraction is $sub" 
}


mul() {
   echo -e "Enter 1st Number:\n"
   read n1
   echo -e "Enter 2nd Number:\n"
   read n2
   mul=$(($n1*$n2))
   echo -e "Multiplication is $mul" 
}


div() {
   echo -e "Enter 1st Number:\n"
   read n1
   echo -e "Enter 2nd Number:\n"
   read n2
   div=$(($n1/$n2))
   echo -e "Divison is $div" 
}


for arg in "$@"; do
  if [[ "$arg" = u ]] || [[ "$arg" = --update ]]; then
    self_update
  fi
  if [[ "$arg" = a ]] || [[ "$arg" = --add ]]; then
     add
  fi
   if [[ "$arg" = s ]] || [[ "$arg" = --sub ]]; then
     sub
  fi
   if [[ "$arg" = m ]] || [[ "$arg" = --mul ]]; then
     mul
  fi
   if [[ "$arg" = d ]] || [[ "$arg" = --div ]]; then
     div
  fi
   if [[ "$arg" = h ]] || [[ "$arg" = --help ]]; then
     _help
  fi
done


