checkPackages() {
  clear

  print "Checking packages..."
  
  sudo [ -d /opt/tomcat/ ] && print "Tomcat already installed" 1 || print "Tomcat has to be installed" 0
  pkgs=("apache2" "mariadb-server")


  for pkg in "${pkgs[@]}"; do
    if ! dpkg-query -W -f='${Status}' $pkg | grep "ok installed" &>/dev/null; then
      echo "Installing: $pkg"
      sudo apt-get install -y $pkg >/dev/null 2>&1
    else
      print "$pkg already installed" 1
    fi
  done
  
  echo -e "${ORANGE}Press any key to continue...${NO_FORMAT}"
  read

  main
}

export -f checkPackages