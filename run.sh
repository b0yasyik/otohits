#!/bin/bash


file="otohits.ini"
cat > $file <<EOFSS
/login:$APPLICATION_KEY
EOFSS


echo "Creating Virtual Display..."
Xvfb :51 & export DISPLAY=:51
echo "Virtual display created :)"
./otohits-app
