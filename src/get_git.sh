#!/bin/bash
#
# ################################################################ #
#
# Title       : getgit
# Author      : Kapitanov Alexander
# E-mail      : sallador@bk.ru
#
# Description : 
#   Extract my remote repositories from github. 
#
#   List of git commands:
#   1. git clone <url> - copy from remote repo to local
#   2. git remote add <short_name> <url> - set short_name for repo
#
#   Globals:
#       WORK_DIR    - "work"    // my base directory
#       GIT_DIR     - "gitrepo" // common git directory
#       FPGA_DIR    - "fpga"    // directory for FPGA projects
#       URL_DIR     - "https://github.com/capitanov/" - remote URL
#
# ################################################################ #
#
# TODO(capitanov): Fix errors and complete bash script
#
# ################################################################ #

# ################################################################ #
check_dir_exist() {
  if [ -d ${GIT_DIR} ] ; then
    echo -e "Pass: Directory /${FPGA_DIR} exists.\nForce delete."
    rm -rf ${GIT_DIR}
  else
    echo -e "Fail: Directory /${FPGA_DIR} does not exists."
  fi
  mkdir -p ${GIT_DIR}/${FPGA_DIR}
}

git_clone_from_remote () {
  cd ${GIT_DIR}/${FPGA_DIR}
  pwd
  for i in "${REPOS[@]}" ; do
    echo -e "\nClone remote directory: ${URL_DIR}/${i}"
    git clone ${URL_DIR}/${i}
    wait
    cd $i
    git remote add ${i} ${URL_DIR}/${i}
    wait
    git remote -v
    cd ..
    echo -e "Pass: Directory ${i} is checked out"

  done
  cd ../..
}
# ################################################################ #

echo "# ################################################################ #"
echo "Stage 0: Set global variables and create working directory"

WORK_DIR="work"
GIT_DIR="gitrepo"
FPGA_DIR="fpga"
URL_DIR="https://github.com/capitanov/"

check_dir_exist

echo "# ################################################################ #"
echo "Stage 1: Clone directories from github"

declare -a REPOS=("intfftk" "fp23fftk" ) #"intfft_spdf" "math" "fp32_logic" \
  # "blackman_harris_win" "adc_configurator" "MinesweeperFPGA" "fp23_logic" \
  # "tcl_for_fpga" "fpga_heart" "Chaotic_Attractors" "Stupid_watch" \
  # "HLx_Examples"
  #)

git_clone_from_remote

echo -e "\nClone operations are completed!"
echo "# ################################################################ #"
