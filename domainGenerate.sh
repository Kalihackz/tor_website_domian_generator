banner() {
clear
echo "
  	 _____           __        __   _     
  	|_   _|__  _ __  \ \      / /__| |__  
  	  | |/ _ \| '__|  \ \ /\ / / _ \ '_ \ 
  	  | | (_) | |      \ V  V /  __/ |_) |
  	  |_|\___/|_|       \_/\_/ \___|_.__/ 
                                       
                                                "| lolcat -p 1
echo "            - A Tor Website Domain Generator for all\n"| lolcat -p 1
echo "                                Version : Bash Final\n"| lolcat -p 1
echo "                                        By Kalihackz\n"| lolcat -p 1
}

banner
echo "\n"
echo -n "                  Starting the Tor Website       " | lolcat -a --duration 10 -s 5 -p 1
echo "\n"

echo -n "[+] [ Enter the hidden service FOLDER name ] : " | lolcat -p 1
read folder_name

echo -n "[+] [ Enter the TOR Website PORT ] : " | lolcat -p 1
read port

echo "\n"
echo "[*] Run time: $(date) @ $(hostname)" | lolcat -p 1

echo "\n"
echo -n "[*] Generating the tor config file ---> torrc" | lolcat -a --duration 10 -s 5 -p 1

echo "HiddenServiceDir $(pwd)/$folder_name
HiddenServicePort 80 127.0.0.1:$port" > torrc

echo "\n"
echo -n "[*] Starting the tor config file ---> tor -f torrc" | lolcat -a --duration 10 -s 5 -p 1

domain=$(cat "$folder_name/hostname")

echo "\n"
echo "TOR Website link : http://"$domain | lolcat -p 1
echo "\n"

gnome-terminal -- sh -c "tor -f torrc" 
