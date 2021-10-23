banner() {
clear
echo "
   ____ _                   _____ ___  ____    ____                        _           
  / ___| | ___  __ _ _ __  |_   _/ _ \|  _ \  |  _ \  ___  _ __ ___   __ _(_)_ __  ___ 
 | |   | |/ _ \/ _\` | '__|   | || | | | |_) | | | | |/ _ \| '_ \` _ \\ / _\` | | '_ \/ __|
 | |___| |  __/ (_| | |      | || |_| |  _ <  | |_| | (_) | | | | | | (_| | | | | \\__ \\
  \____|_|\___|\__,_|_|      |_| \___/|_| \\_\\ |____/ \\___/|_| |_| |_|\\__,_|_|_| |_|___/
                                                                                                                                   
                                                "| lolcat -p 1
echo "		                                 - A Tor Deletion Setup file for all\n"| lolcat -p 1
echo "		                                                Version : Bash Final\n"| lolcat -p 1
echo "		                                                        By Kalihackz\n"| lolcat -p 1
}

banner

echo -n "[+] [ Enter the hidden service FOLDER name ] : " | lolcat -p 1
read folder_name

echo "\n"
echo -n "[*] Removing files and directories" | lolcat -a --duration 10 -s 5 -p 1

echo "[$(date)] | Message : Tor files deleted from $(pwd)/$folder_name " >> logs.txt

rm -rf "$folder_name"
rm torrc

echo "\n"
echo -n "[*] Deleted all TOR domains" | lolcat -a --duration 10 -s 5 -p 1
