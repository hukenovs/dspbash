#!/bin/bash
#
# ########################################################################## #
#
# Title       : getgit
# Author      : Kapitanov Alexander
# E-mail      : sallador@bk.ru
# Date        : 2019/05/20
#
# Description : 
#   Extract my remote repositories from github. 
#
#   Create/open your working \gitrepo\ directory on local machine,
#   move to working directory and execute this bash script.
#
#   List of git commands:
#   1. git clone <url> - copy from remote repo to local
#   2. git remote add <short_name> <url> - set short_name for repo
#
#   Globals:
#     (Deprecated) WORK_DIR    - "work"    // my base directory
#     (Deprecated) GIT_DIR     - "gitrepo" // common git directory
#     FPGA_DIR    - "fpga"    // directory for FPGA projects
#     URL_DIR     - "https://github.com/capitanov/" remote URL
#     REPOS       - array of @username repositories
#
#   Fuctions:
#     check_dir_exist() - Checks if working directory exist.
#       Remove if exist and create new directory for git repos
#       Args: $1 - directory name
#
#     git_clone_from_remote() - Clone remote repos to local dir
#       Args: $1 - URL name, e.g., https://github.com/capitanov/
#
#     git_main() - Execute main procedure w/ global variables
#
# ########################################################################## #
#
# TODO(capitanov): 
#
# ########################################################################## #
# Global variables
# ########################################################################## #

FPGA_DIR="fpga"
URL_DIR="https://github.com/capitanov/"

declare -a REPOS=("intfftk" "fp23fftk" "intfft_spdf" "math" "fp32_logic" \
  "blackman_harris_win" "adc_configurator" "MinesweeperFPGA" "fp23_logic" \
  "tcl_for_fpga" "fpga_heart" "Chaotic_Attractors" "Stupid_watch" \
  "HLx_Examples"
  )

DEC_LINE="# ########################################################\
############ #"

# ########################################################################## #
# Function declaration
# ########################################################################## #

check_dir_exist() {
  if [ -d ${1} ] ; then
    echo "Pass: Directory /${FPGA_DIR} exists. Force delete."
    rm -rf ${1}
  else
    echo "Fail: Directory /${FPGA_DIR} does not exists."
  fi
  mkdir -p ${1}
}

git_clone_from_remote () {
  for i in "${REPOS[@]}" ; do
    echo -e "\nClone remote directory: ${1}/${i}"
    git clone ${1}${i}
    wait
    cd $i
    git remote add ${i} ${1}/${i}
    wait
    git remote -v
    cd ..
    echo -e "Pass: Directory ${i} is checked out"
  done
}

git_main() {
  echo ${DEC_LINE}
  echo "Stage 0: Set global variables and create working directory"
  
  cd ../.. # if you run this script from dspbash/src directory
  check_dir_exist ${FPGA_DIR}
  
  echo ${DEC_LINE}
  echo "Stage 1: Clone directories from github"
  
  cd ${FPGA_DIR}; pwd
  git_clone_from_remote ${URL_DIR}
  cd ..; pwd

  echo ${DEC_LINE} 
}

git_main
# ########################################################################## #