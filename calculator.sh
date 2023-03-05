#!/usr/bin/bash
self_update() {
  cd $HOME/.local/share/bash-calc
  git pull -f
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

self_update
main
