createWebApp() {
  readOpt "Insert the folder name: " fname false

  if [ -d "$path/$fname" ]; then
    print "Directory already exists, change name." 0
    createWebApp
  fi

  sudo mkdir $path/$fname{,/WEB-INF{,/classes}}
  sudo cp ./src/other/web.xml $path/$fname/WEB-INF/web.xml
  print "WebApp created" 1
  sleep 1
}

deleteWebApp() {
  if [ -z "$(sudo ls -A $path)" ]; then
    print "There are no WebApps to delete!" 0
    sleep 1
    manageWebApps
  fi

  readOpt "Insert the folder name: " dname false

  sudo [ -d "$path/$dname" ] && sudo rm -rf $path/$dname || print "This WebApp doesn't exist!" 0
}

listWebApps() {
  [ -n "$(sudo ls -A $path 2>/dev/null)" ] && sudo ls $path || print "There are no WebApps to print!" 0
}

export -f createWebApp deleteWebApp listWebApps