#!/bin/bash
echo "==================================="
echo "Welcome to Otohits Docker Viewer :)"
echo "==================================="
echo " "
read -p 'Enter Your Application Key: ' APPLICATION_KEY

file="otohits.ini"
cat > $file <<EOFSS
/login:$APPLICATION_KEY
/nosandbox
/autoupdate
EOFSS

sleep 1

echo "==========================="
echo "Creating Virtual Display..."
echo "==========================="
echo " "
sleep 2
Xvfb :51 & export DISPLAY=:51
echo "=========================="
echo "Virtual display created :)"
echo "=========================="
echo " "
echo "Starting the Viewer..."
echo " "
./otohits-app &
sleep 3

while [ 1 != 0 ]
do
while [[ ! $(pidof otohits-app) ]]; do
        echo "Restarting...."
        killall otohits-app otohits-viewer chromium-browser chrome-sandbox
        ./otohits-app
        echo "Restarted...."
        sleep 120
done
sleep 120
done
