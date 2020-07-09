#!/bin/bash


file="Otohits/otohits.ini"
cat > $file <<EOFSS
/login:$APPLICATION_KEY
/nosandbox
EOFSS


echo "Creating Virtual Display..."
Xvfb :51 & export DISPLAY=:51
echo "Virtual display created :)"
./Otohits/otohits-app
