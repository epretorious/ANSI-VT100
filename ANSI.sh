#!/bin/bash
# Eric Pretorious <ericx.pretorious@intel.com> (May, 2022)
#
# Display ANSI colors
# https://www.shellhacks.com/bash-colors/
# https://renenyffenegger.ch/notes/Linux/shell/ANSI-escape-sequences


declare -i FGc FGe BGc BGe ;

# Foreground color
for (( FGc=0 ; FGc < 8 ; FGc++ )) ; do

  # Foreground effect
  for FGe in 3 9 ; do
    FG=${FGe}${FGc} ;

    # Background effect
    for BGe in 4 10 ; do
      if [[ ${BGe} == 4 ]] ; then
        echo -en "\e[${FG}mThe foreground color is ${FG}:\e[0m  " ; else
        echo -n "                             " ;
      fi ;

      # Background color
      for (( BGc=0 ; BGc < 8 ; BGc++ )) ; do
        BG=${BGe}${BGc} ;
        printf "\e[${FG};${BG}m%3s;%-4s\e[0m" ${FG} ${BG} ;
      done ;
      echo ;

    done ;

  done ;
  echo -e "____________________\n" ;

done ;

echo -e "\e[0;37mThis is plain white.\e[0m" ;
echo -e "\e[0;97mThis is bright white.\e[0m" ;
echo -e "\e[1;37mThis is BOLD plain white.\e[0m" ;
echo -e "\e[1;97mThis is BOLD bright white.\e[0m" ;
