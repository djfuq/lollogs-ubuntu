#!/bin/bash
bash -c 
#....
# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
# ...

mkdir LOLLOG 
cd LOLLOG
rm -rfv 00 01 02 1 2 3 4 5 6 lolcat-tail-ascii-logs.bash tail-ascii-logs.bash
gem install lolcat
find /var/log/ -type f -exec file -F\  "{}"    \; >> 1
grep ASCII 1 > 2  
awk '{print $1}'  2 > 3
cat 3  | tr "\n" " " > 4
cat 4  | tr ":" " " > 5
echo 'tail -F -n 200 ' >  00
cat 5 >> 00
 
cat 00 | tr "\n" " " > 01
cat 01 | tr ":" " "  > 02
echo '#!/bin/bash' > tail-ascii-logs.bash
echo -e "\n" >> tail-ascii-logs.bash
cat 02 >> tail-ascii-logs.bash
chmod -v +x *scii-logs.bash
cp -av tail-ascii-logs.bash lolcat-tail-ascii-logs.bash
echo ' | lolcat' >> lolcat-tail-ascii-logs.bash

cp -av lolcat-tail-ascii-logs.bash /usr/bin/lollogs
cp -a tail-ascii-logs.bash  /usr/bin/taillogs
echo 'run lollogs from now on if you want'
lollogs

