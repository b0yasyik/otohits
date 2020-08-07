#!/bin/bash


echo "/login:$APPLICATION_KEY
/nosandbox" > otohits.ini

if [ $AUTOUPDATE == "true" ]; then
    echo "/autoupdate" >> otohits.ini
else
    echo "========================="
    echo "AutoUpdate is Disabled :("


if [ $BETA == "true" ]; then
    echo "/beta" >> otohits.ini
else
    echo "Beta Version is Disabled :("
fi

sleep 1

echo "==========================="
echo "Creating Virtual Display..."
echo "==========================="
echo " "
Xvfb :51 & export DISPLAY=:51
sleep 2
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
