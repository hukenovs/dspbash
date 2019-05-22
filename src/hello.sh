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
#     0. Download script or create empty file without extension or w/ *.sh
#     1. Start all of your bash scripts w/ command: #!/bin/bash
#     2. Open terminal (e.g., press Ctrl+Alt+T)
#     3. Move to working directory by using 'cd' command
#     4. Execute bash script with the next command: 
#         bash hello.sh
#         ./hello.sh
#
#   If you see "Permission denied" when running *.sh scripts:
#     >> sudo chmod +x <script_name>
#
# ########################################################################## #
# 
#   Section 0x0: Hello World
#   Section 0x1: Display command 'echo' with attributes
#   Section 0x2: Math operations ( + , - , / , * , % , ** )
#   Section 0x3: Floating-point math output
#   Section 0x4: While loop + if-then-else
#   Section 0x5: For loop + if-then-else
#   Section 0x6: Read from terminal with agruments
#   Section 0x7: Case statement ( + read operation )
#   Section 0x8: Read from terminal with named agruments
#   Section 0x9: Functions and local variables
#   Section 0xA: Date and time
#   Section 0xB: Check if file or directory exists
#   Section 0xC: Regular expressions. Match patterns
#   Section 0xD: Write data to file
#   Section 0xE: Read data from file
#
#   Help in terminal: 
#     >> man bash
#
#   Use "Shell Style Guide" by Google for best reading and performance of 
#   your code.
#
# ########################################################################## #
echo -e "####################################################"
echo -n "######## Bash script examples for begginers ########"
echo -e "\n#### Example 0: Hello World\n" 

sthello="Hello World!"
echo "$sthello"

# ########################################################################## #
echo -e "\n#### Example 1: echo with -e & -n attributes\n"

echo "Hello\nWorld (without attributes)"
echo -n "Hello "
echo "Wolrd (with -n: printing text without new line)"
echo -e "Hello\nWorld (with -e: printing with new line between words)"

# ########################################################################## #
echo -e "\n#### Example 2: Integer math operations: ((expression))\n"

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
echo -e "\n#### Example 3: Floating-point math operations\n"

echo -e "For float/double calculation you can add '| bc' after your expression."
echo -e "Command '| bc -l' after expr gets maximum digits after decimal point."
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
echo -e "\n#### Example 4: While loop (with if-then-else)\n"

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

# ############################################################################ #
echo -e "\n#### Example 5: For loop (with if-then-else)\n"

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
echo -e "\n#### Example 6: Read operations, while loop & if-then-else\n"

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
echo -e "\n#### Example 7: Case statement\n"

# echo -n "Enter a value between 1 and 3:  " && read cnum
# case ${cnum} in
#   1) echo "${cnum} is the first" ;;
#   2) echo "${cnum} is the second" ;;
#   3) echo "${cnum} is the third" ;;
#   *) error "Unexpected value!" ;;
# esac
echo -e "Skip this section because of 'read' operator. Uncomment if needed."

# ############################################################################ #
echo -e "\n#### Example 8: Get arguments from command line\n"

echo -e "Just put arguments after script name and get them into the script."
# echo "Your 1ns argument = $1"
# echo "Your 2nd argument = $2"
# echo "Number of arguments = $#"

echo -e "You can put name with its value for external variables e.g.,"
echo -e "write 'a=value b=value' after script in terminal"
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
  echo -e "\nPass: Sum of ${a} and ${b} are $(( ${a}+${b} ))"
else
  echo -e "\nFail: One or more parameters are NULL. Cannot calculate sum"
fi

# ############################################################################ #
echo -e "\n#### Example 9: Functions. Use 'echo' for return value\n"

echo -e "By default variables are global. Use local keyword to change its type."
echo -e "A local variable is visible only within the block of code in which it \
appears.\n"
echo -e "Function 'math_of_two()' has two arguments and one math operator."
echo -e "It can operate with: +, -, *, /, % and **. Examples:\n"

# math_of_two() - integer math operation of two variables,
#   Args:
#     $1 - 1st integer variable
#     $2 - 2nd integer variable
#     $3 - math operator: +, -, *, /, % or **
function math_of_two() {
  local ad1=$1;
  local ad2=$2;
  local opm=$3;
  local res=0;
  case ${opm} in
    "+")  res=$(( ad1 +  ad2 )) ;;
    "-")  res=$(( ad1 -  ad2 )) ;;
    "*")  res=$(( ad1 *  ad2 )) ;;
    "/")  res=$(( ad1 /  ad2 )) ;;
    "%")  res=$(( ad1 %  ad2 )) ;;
    "**") res=$(( ad1 ** ad2 )) ;;
    *) res="Error, cannot calculate data";
  esac
  echo ${res}
}

a1=5; a2=2;
ops=$(math_of_two ${a1} ${a2} "+")  && echo ">>   ${a1} +  ${a2}  =  ${ops}"
ops=$(math_of_two ${a1} ${a2} "-")  && echo ">>   ${a1} -  ${a2}  =  ${ops}"
ops=$(math_of_two ${a1} ${a2} "*")  && echo ">>   ${a1} *  ${a2}  =  ${ops}"
ops=$(math_of_two ${a1} ${a2} "/")  && echo ">>   ${a1} /  ${a2}  =  ${ops}"
ops=$(math_of_two ${a1} ${a2} "%")  && echo ">>   ${a1} %  ${a2}  =  ${ops}"
ops=$(math_of_two ${a1} ${a2} "**") && echo ">>   ${a1} ** ${a2}  =  ${ops}"
ops=$(math_of_two ${a1} ${a2} "xx") && echo ">>   ${a1} ?? ${a2}  =  ${ops}"


# ############################################################################ #
echo -e "\n#### Example 10: Date and time\n"

echo -e "Press 'date --help' to see help about date and time commands.\n"

Second=`date +%S`
Minute=`date +%M`
Hour=`date +%H`

Day=`date +%d`
Month=`date +%m`
Year=`date +%Y`
Date=`date`

echo "Current Date is: ${Year}/${Month}/${Day}"
echo "Current Time is: ${Hour}:${Minute}:${Second}"

# ############################################################################ #
echo -e "\n#### Example 11: Check if file or directory exists\n"

function check_file() {
  local fname=$1;
  if [[ -f ${fname} ]]; then
    rm -rf ${fname}
    echo "File '${fname}' exists. Force delete and create new."
  else
    echo "File '${fname}' doesn't exists. Create file ${fname}."
  fi
  touch ${fname}
}

function check_dir() {
  local dname=$1;
  if [[ -d ${dname} ]]; then
    rm -rf ${dname}
    echo "Directory /${dname} exists. Force delete and create new."
  else
    echo "Directory /${dname} doesn't exists. Create /${dname}."
  fi
  mkdir -v ${dname}
}

file_name="test.txt"
dir_name="test"
check_file ${file_name}
check_dir  ${dir_name}

rm -rf ${file_name} ${dir_name}

# ############################################################################ #
echo -e "\n#### Example 12: Regular expressions. Regex bash\n"

echo "Common regex commands:\n"
echo "?    - zero or one occurrences of the preceding element,"
echo "*    - zero or more occurrences of the preceding element,"
echo "+    - one or more occurrences of the preceding element,"
echo "^    - starting position within the string,"
echo "[ ]  - single character that is contained within the brackets,"
echo "[^ ] - single character that is not contained within the brackets,"
echo "( )  - marked subexpression,"
echo "$    - ending position of the string,"
echo "\d   - any digit [0-9]"
echo "\D   - not a digit [^0-9]"
echo "\n   - new line symbol"
echo "\t   - tab symbol"
echo "\s   - space symbol"
echo "\v   - vertical tab symbol"
echo -e ".    - wildchart: matches any character,\n"

exstr="This is example string has some numbers 1 2 3 4 5 6 11 12 13,\n\
tabs: \t, new line:\nand some words: {cat} \t{hat} \t{rat} \t{bat} \t{123}"

echo -e "Example string:\n" && echo -e "${exstr}" && echo ""

echo "Find strings .at pattern, RegEx = ( .at ) : " 
echo ${exstr} | grep -o -P "(.at)" && echo ""

echo "Find two-digit numbers, RegEx = ( \d\d ) : " 
echo ${exstr} | grep -o -P "(\d\d)" && echo ""

echo -e "The next regex pattern means 'find all strings or characters inside \
{} \nwith only digits into the string.\n"
echo -n "Inside brackets, RegEx = ( \{([^\{\}\D]+)\} ) : "
echo ${exstr} | grep -o -P "(\{([^\{\}\D]+)\})"

# ############################################################################ #
echo -e "\n#### Example 13: Write to file\n"



# ############################################################################ #
echo -e "\n################ End of bash script ################"
echo -e "####################################################"
# ############################################################################ #
