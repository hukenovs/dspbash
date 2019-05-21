#!/bin/bash
# ########################################################################## #
#
# Title       : hello.sh
# Author      : Kapitanov Alexander
# E-mail      : sallador@bk.ru
# Date        : 2019/05/20
#
# Description : 
#   Bash script examples for begginers. 
#
#   How to use:
#     1. Download this script
#     2. Open terminal (Press Ctrl+Alt+T)
#     3. Move to working directory by using 'cd' command
#     4. Execute this bash script, e.g., ./hello.sh or bash hello.sh
#
#
# Important! Start all of your bash scripts w/ command: #!/bin/bash
#
# Help in terminal: man bash
#
# ########################################################################## #
# Section: Input/output 
#   echo   - display a line of string on standard output or a file
#   printf - prints a formatted string to the standard output
#   read   - read line/data from the standard input
#
# ########################################################################## #

# ########################################################################## #
echo -n "######## Bash script examples for begginers ########"
echo -e "\n#### Example 1: Hello World\n" 

sthello="Hello World!"
echo "$sthello"

# ########################################################################## #
echo -e "\n#### Example 2: echo with -e & -n attributes\n"

echo "Hello\nWorld (without attributes)"
echo -n "Hello "
echo "Wolrd (with -n: printing text without new line)"
echo -e "Hello\nWorld (with -e: printing with new line between words)"

# ########################################################################## #
echo -e "\n#### Example 3: math operations: ((expression))\n"

Anum=7; Bnum=4;
add=$(( Anum +  Bnum ))
sub=$(( Anum -  Bnum ))
mlt=$(( Anum *  Bnum ))
div=$(( Anum /  Bnum ))
mod=$(( Anum %  Bnum ))
exp=$(( Anum ** Bnum ))

echo "Input arguments: A = ${Anum}, B = ${Bnum}"
echo "Add  = ${Anum}  + ${Bnum} = ${add}"
echo "Sub  = ${Anum}  - ${Bnum} = ${sub}"
echo "Mult = ${Anum}  * ${Bnum} = ${mlt}"
echo "Div  = ${Anum}  / ${Bnum} = ${div}"
echo "Mod  = ${Anum}  % ${Bnum} = ${mod}"
echo "Exp  = ${Anum} ** ${Bnum} = ${exp}"
echo "Another way is to use \`expr\` word with backtick, e.g. \`expr A + B\`"

# ########################################################################## #
echo -e "\n#### Example 4: Floating-point operations\n"

echo -e "For float/double calculation you can add '| bc' after your expression"
echo -e "Command '| bc -l' after expr gets maximum digits after decimal point"
echo -e "Also you can use scale=num before expression, e.g. 'scale=4; 7/3 | bc'\n"

# div_float() - floating-point divider with accuracy parameter,
#   Args:
#     $1 - dividend
#     $2 - divisor
#     $3 - accuracy (digits after the decimal point)
function div_float () {
    echo "scale = $3; $1 / $2" | bc
}

acc=6; echo "Accuracy = ${acc}, Divide: ${Anum} / ${Bnum} = $(div_float $Anum $Bnum $acc)"
acc=3; echo "Accuracy = ${acc}, Divide: ${Anum} / ${Bnum} = $(div_float $Anum $Bnum $acc)"
echo -n "Accuracy = ${acc}, (use scale)   = "; echo "scale=$acc; $Anum / $Bnum" | bc

# ############################################################################ #
echo -e "\n#### Example 5: While loop & for loop (with if-then-else)\n"

echo -e "Compare operations:"
echo -e "-lt - less than \n-gt - greater than \n-eq - equal to \n-ne - not equal to"
echo -e "-le - less than or equal to \n-ge - greater than or equal to \n"

echo -n "(While loop) Counter from 0 to N-1: "
cnt=0; N=10
while [ true ]; do
  if [ $cnt -eq $N ]; then
    echo "" && break
  else
    echo -n "${cnt} " && ((cnt++))
  fi
done

echo -n "(For loop)   Counter from 0 to N-1: "
cnt=0; N=10
for (( i = 0; i <= $N; i++ )); do
  if [ $cnt -eq $N ]; then
    echo ""
  else
    echo -n "${cnt} " && ((cnt++))
  fi
done

# ############################################################################ #
echo -e "\n#### Example 7: Read operations, while loop & if-then-else\n"

# while [ true ]; do
#   echo -n "Enter your login (e.g., user):  " && read username
#   echo -n "Enter your password (e.g., pass):  " && read password
#   if [[ (${username} == "user" && ${password} == "pass") ]]; then
#     echo -e "OK: Username = ${username}, Password = ${password}" && break
#   else
#     echo -e "Wrong. Try again! Username = ${username}, Password = ${password}.\n"
#   fi
# done
echo -e "Skip this section because of 'read' operator. Uncomment if needed."

# ############################################################################ #
echo -e "\n#### Example 8: Case statement\n"

# echo -n "Enter a value between 1 and 3:  " && read cnum
# case ${cnum} in
#   1) echo "${cnum} is the first" ;;
#   2) echo "${cnum} is the second" ;;
#   3) echo "${cnum} is the third" ;;
#   *) error "Unexpected value!" ;;
# esac
echo -e "Skip this section because of 'read' operator. Uncomment if needed."

# ############################################################################ #
echo -e "\n#### Example 9: Get arguments from command line\n"

echo -e "Just put arguments after script name and get them into the script"
# echo "Your 1ns argument = $1"
# echo "Your 2nd argument = $2"
# echo "Number of arguments = $#"

echo -e "You can put name with its value for external variables e.g., write "
echo -e "a=value b=value after script in terminal"
for arg in "$@"; do
  idx=$(echo $arg | cut -f1 -d=)
  val=$(echo $arg | cut -f2 -d=)
  case ${idx} in
    a) a=$val ;;
    b) b=$val ;;
    *) 
  esac
done
if [[ ($a && $b) ]]; then
  echo -e "Sum of ${a} and ${b} are $(( ${a}+${b} ))"
else
  echo -e "One or more parameters are NULL. Cannot calculate sum"
fi


echo -e "\n####################################################"
