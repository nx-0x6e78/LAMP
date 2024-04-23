readOpt() {
  echo -en "${BLUE}$1"
  [ $3 = true ] && read -n 1 $2 || read $2
}

print() {
  case $2 in
    0) echo -e "${RED}$1${NO_FORMAT}" ;;
    1) echo -e "${GREEN}$1${NO_FORMAT}" ;;
    2) echo -e "${BLUE}$1${NO_FORMAT}" ;;
    *) echo -e "${ORANGE}$1${NO_FORMAT}" ;;
  esac
}

openFolders() {
  echo
  sudo -E xdg-open $path
  sudo -E xdg-open /var/www/html
  main
}

menu() {
  print " +--------- LAMPP ---------+"
  print " | 1) Check packages       |"
  print " | 2) Manage services      |"
  print " | 3) Start mariadb shell  |"
  print " | 4) Open folders         |"
  print " | 5) Manage WebApps       |"
  print " | 0) Quit                 |"
  print " +-------------------------+"
  print " | v1.3.2                  |"
  print " +-------------------------+"
}

startMDBShell() {
  sudo systemctl start mariadb
  gnome-terminal -- sh -c "bash -c \"sudo mysql -u root ; exec bash\""
  main
}

export -f readOpt print openFolders menu startMDBShell
