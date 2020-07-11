$world_name = ""
$motd = ""
$ngrok_token = ""

[ ! -f "Linux/ngrok" ] && wget -O n.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
[ ! -f "Linux/ngrok" ] && unzip n.zip -d Linux
[ -f "Linux/n.zip" ] && rm n.zip
cd Linux
chmod +x ngrok
chmod +x TerrariaServer.bin.x86_64
./ngrok authtoken $ngrok_token
./ngrok tcp 7777 -region us &>/dev/null &
sleep 1
curl -s "http://127.0.0.1:4040/api/tunnels" | jq '.["tunnels"][0] | .public_url'
echo This is what you need to connect. Copy it and
read -p "press enter to continue."
./TerrariaServer.bin.x86_64 -world ~/world/$world_name.wld -port 7777 -motd $motd && fg
#./TerrariaServer.bin.x86_64 && fg
echo Saving world
cd
#cp ~/.local/share/Terraria/Worlds/fuck.wld world
#cp ~/.local/share/Terraria/Worlds/fuck.wld.bak world
#cp ~/.local/share/Terraria/Worlds/fuck.wld.bak2 world
