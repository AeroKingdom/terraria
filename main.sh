echo Creating worlds folder
mkdir ~/.local/share/Terraria/Worlds
echo Copying current world to world file
cp fuck.wld ~/.local/share/Terraria/Worlds
echo Downloading Terraria server
wget -O t.zip https://www.terraria.org/system/dedicated_servers/archives/000/000/039/original/terraria-server-1405.zip?1591301368
unzip t.zip
rm t.zip
echo Downloading ngrok
wget -O n.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip n.zip -d 1405/Linux
rm n.zip
echo Starting server
cd 1405/Linux
./ngrok authtoken 1bj5JSh8cZ3bR35EMogYsAiGz8l_2KFXo2GddpZatuMptENqJ
./ngrok tcp 7777 -region us & bg & ./TerrariaServer.bin.x86_64