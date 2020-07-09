#!/bin/bash


file="Otohits/otohits.ini"
cat > $file <<EOFSS
/login:$APPLICATION_KEY
/nosandbox
EOFSS


echo "Creating Virtual Display..."
Xvfb :51 & export DISPLAY=:51
echo "Virtual display created :)"
./Otohits/otohits-app &

while [ 1 != 0 ]
do
while [[ ! $(pidof otohits-app) ]]; do
        echo "Restarting...."
        killall otohits-app otohits-viewer chromium-browser chrome-sandbox
        ./Otohits/otohits-app
        exit
        echo "Restarted...."
        sleep 120
done
sleep 120
done
