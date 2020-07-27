#!/bin/bash


file="Otohits/otohits.ini"
cat > $file <<EOFSS
/login:$APPLICATION_KEY
/nosandbox
EOFSS

echo "==========================="
echo "Creating Virtual Display..."
echo "==========================="
echo " "
Xvfb :51 & export DISPLAY=:51
echo "=========================="
echo "Virtual display created :)"
echo "=========================="
echo " "
echo "Starting the Viewer..."
echo " "
./Otohits/otohits-app &
sleep 3

while [ 1 != 0 ]
do
while [[ ! $(pidof otohits-app) ]]; do
        echo "Restarting...."
        killall otohits-app otohits-viewer chromium-browser chrome-sandbox
        ./Otohits/otohits-app
        echo "Restarted...."
        sleep 120
done
sleep 120
done
