#! /bin/bash

source "./src/utils.sh"
source "./src/packages.sh"
source "./src/managers.sh"
source "./src/webapps.sh"

NO_FORMAT="\033[0m"
ORANGE="\033[38;5;214m"
RED="\033[38;5;9m"
GREEN="\033[38;5;40m"
BLUE="\033[38;5;44m"
path=/opt/tomcat/apache-tomcat-10.1.19/webapps

main() {
  clear
  menu
  readOpt "Select an option > " opt true

  case "${opt}" in
    1) checkPackages ;;
    2) manageServices ;;
    3) startMDBShell ;;
    4) openFolders ;;
    5) manageWebApps ;;
    0) echo; clear; exit 0 ;;
    *) main ;;
  esac
}

main
