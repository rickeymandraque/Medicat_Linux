#!/usr/bin/env bash
# The shebang must be env to detect *bsd and MacOS


echo "send this on discord please"
echo '```'
echo "=================================="
echo -e "\tget os type"
echo "=================================="
echo "os detected with ostype : $OSTYPE"
echo "os detected with uname : $(uname -s)"
echo -e "cat proc output :\n$(cat /proc/version)"
echo "hostnamectl outputs :"
hostnamectl | grep 'Operating System' | awk -F": " '{print $2 ;}' | sed 's/ [0-9].*//g'
hostnamectl | grep 'Kernel' | awk -F": " '{print $2 ;}' | sed 's/ [0-9].*//g'
echo "=================================="
echo -e "\tget os Arch type"
echo "=================================="
echo "os detected with hosttype : $HOSTTYPE"
echo "os detected with uname : $(uname -m)"
echo "hostnamectl outputs :"
hostnamectl | grep 'Architecture' | awk -F": " '{print $2 ;}' | sed 's/ [0-9].*//g'
echo "os detected with machtype : $MACHTYPE"
echo "=================================="
echo -e "\tget os info"
echo "=================================="
echo -e "ls output :\n$(ls /etc/*release*)"
cat /etc/*release*
echo "=================================="
echo -e "full uname output:\n$(uname -a)"

if [[ "$OSTYPE" =~ darwin* ]] || [[ "$(uname -s)" =~ darwin ]]; then
  OIFS="$IFS"
  IFS=$'\n'
  set $(sw_vers) >/dev/null
  Distrib_Name=$(echo $1 | tr "\n" ' ' | sed 's/ProductName:[ ]*//')
  VERSION=$(echo $2 | tr "\n" ' ' | sed 's/ProductVersion:[ ]*//')
  BUILD=$(echo $3 | tr "\n" ' ' | sed 's/BuildVersion:[ ]*//')
  IFS="$OIFS"
  echo "$Distrib_Name $VERSION $BUILD"
fi
echo '```'
echo "Thank you for your participation"
