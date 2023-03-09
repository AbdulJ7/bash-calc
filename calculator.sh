#!/usr/bin/bash
self_update() {
  # store the current dir
CUR_DIR=$(pwd)

repos=( 
  "$HOME/.local/share/bash-calc"
)

echo ""
echo "Getting latest for" ${#repos[@]} "repositories using pull --rebase"

for repo in "${repos[@]}"
do
  echo ""
  echo "****** Getting latest for" ${repo} "******"
  cd "${repo}"
  git pull --rebase
  echo "******************************************"
done

#lets go back current directory
cd $CUR_DIR

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


