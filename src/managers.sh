manageServices() {
  clear
  print " +--- Checking Services ---+"
  print " | start/stop/restart svcs |"
  print " | 0) Return back          |"
  print " +-------------------------+"

  pkgs=("tomcat" "apache2" "mariadb")

  for pkg in "${pkgs[@]}"; do
    status=$(systemctl is-active ${pkg})
    print "$pkg: $status" $([[ ${status} == "active" ]] && echo 1 || echo 0)
  done

  readOpt "> " opt false

  case "${opt}" in
  "stop *") sudo systemctl stop apache2 tomcat mariadb ;;
  "start *") sudo systemctl start apache2 tomcat mariadb ;;
  0) main ;;
  *) [[ -n ${opt} ]] && sudo systemctl ${opt} ;;
  esac

  sleep 1s
  manageServices
}

manageWebApps() {
  clear
  print " +----- Manage WebApp -----+"
  print " | 1) Create WebApp        |"
  print " | 2) Delete WebApp        |"
  print " | 3) List WebApps         |"
  print " | 0) Return Back          |"
  print " +-------------------------+"

  readOpt "Select an option > " opt true
  echo

  case "${opt}" in
  1) createWebApp ;;
  2)
    listWebApps
    deleteWebApp
    ;;
  3)
    listWebApps
    sleep 2
    ;;
  0) main ;;
  *) manageWebApps ;;
  esac

  manageWebApps
}

export -f manageServices manageWebApps
