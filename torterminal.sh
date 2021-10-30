#Version : 1.0.20
clear

banner() {

echo "
  _____            _____                   _             _ 
 |_   _|__  _ __  |_   _|__ _ __ _ __ ___ (_)_ __   __ _| |
   | |/ _ \| '__|   | |/ _ \ '__| '_ \` _ \\| | '_ \ / _\` | |
   | | (_) | |      | |  __/ |  | | | | | | | | | | (_| | |
   |_|\___/|_|      |_|\___|_|  |_| |_| |_|_|_| |_|\__,_|_|
                                                           "| lolcat -p 1
echo "                  	       - A T0R W3B Toolkit for all\n"| lolcat -p 1
echo "                          	          Version : $currentVersion\n"| lolcat -p 1
echo "                          	              By Kalihackz\n"| lolcat -p 1

}

generateTorDomain() {

mkdir "$1"
echo "[$(date)] | Message : Tor files genereated at $(pwd)/$1 " > "$1/logs.txt"
echo "\n"
echo "[*] Run time: $(date) @ $(hostname)" | lolcat -p 1
echo "HiddenServiceDir $(pwd)/$1
HiddenServicePort 80 127.0.0.1:$2" > torrc
echo "\n"
echo -n "[*] Please close the other window after it shows [ 'Bootstrapped 100% (done): Done' ] at last" | lolcat -a --duration 10 -s 5 -p 1
echo "\n"
echo -n "[*] Writing and starting default tor config file ---> tor -f torrc" | lolcat -a --duration 10 -s 5 -p 1
echo "\n"
chmod 700 $1
gnome-terminal --geometry 80x24+780+50 --title "Generating Tor Domain" -- sh -c "tor -f torrc"

}

listTorDomain() {

echo "\n"
echo -n "[*] Run time: $(date) @ $(hostname)" | lolcat -p 1
echo "\n"
echo -n "[*] Listing all domains . . ." | lolcat -a --duration 10 -s 5 -p 1
echo "\n"
echo "-------------------------------------------------------------------|-------------"
echo "                           Domain address                          | Folder Name "
echo "___________________________________________________________________|_____________"
for f in *; do
    if [ -d "$f" ]; then
        # Will not run if no directories are available
        # Do not create useless directories manually
        echo "[#] $(cat $f/hostname) | $f"
    fi
done
echo "\n"
}

startTorDomain() {

echo "[$(date)] | Message : Tor hidden service started at $(pwd)/$1 " >> "$1/logs.txt"
echo "\n"
echo "[*] Run time: $(date) @ $(hostname)" | lolcat -p 1
echo "\n"
echo -n "[*] Modifying the tor config file ---> torrc" | lolcat -a --duration 10 -s 5 -p 1
echo "HiddenServiceDir $(pwd)/$1
HiddenServicePort 80 127.0.0.1:$2" > torrc
echo "\n"
echo -n "[*] Starting the tor config file ---> tor -f torrc" | lolcat -a --duration 10 -s 5 -p 1
domain=$(cat "$1/hostname")
echo "\n"
echo "TOR Website link : http://"$domain | lolcat -p 1
echo "\n"
gnome-terminal --geometry 80x24+780+50 --title "Tor Domain Started" -- sh -c "tor -f torrc" 

}

currentVersion=$(cat version.txt)
updateVersion=$(curl -s 'https://raw.githubusercontent.com/Kalihackz/tor_website_domian_generator/main/version.txt' -L)
banner

if [ $updateVersion \> $currentVersion ] 
then
    echo -n "                 [ Update Available - $updateVersion ]" | lolcat -a --duration 10 -s 5 -p 1
    echo "\n"
fi

while true
do
echo -n "\033[0;31m\033[1m$(whoami)@tor\033[0m:\033[1m\033[0;34m$(pwd)\033[0m$ "
read commandVar
case $commandVar in
'clear')
clear
;;
'exit')
echo "\n"
echo -n "[*] Cleaning and exiting" | lolcat -a --duration 10 -s 5 -p 1
exit
;;
'tordomain start')
echo  "\n--------------------------------------------------------------------"
echo -n "[+] [ Enter the hidden service FOLDER name ] : "
read folder_name
echo "\n"
echo -n "[+] [ Enter the TOR Website PORT ] : "
read port
echo  "---------------------------------------------------------------------"
startTorDomain $folder_name $port
;;
'tordomain activate')
echo  "\n---------------------------------------------------------------------"
echo -n "[+] [ Enter the hidden service FOLDER name ] : "
read folder_name
echo "\n"
echo -n "[+] [ Enter the TOR Website PORT ] : "
read port
echo  "---------------------------------------------------------------------"
generateTorDomain $folder_name $port
;;
'tordomain list')
listTorDomain
;;
'tordomain delete')
echo  "\n---------------------------------------------------------------------"
echo -n "[+] [ Enter the hidden service FOLDER name ] : "
read folder_name
echo  "---------------------------------------------------------------------"
echo "\n"
echo "[*] Run time: $(date) @ $(hostname)" | lolcat -p 1
echo "\n"
echo -n "[*] Deleting $folder_name related domain" | lolcat -a --duration 10 -s 5 -p 1
rm -rf "$folder_name"
echo "\n"
;;
'tordomain reactivate')
echo  "\n---------------------------------------------------------------------"
echo -n "[+] [ Enter the hidden service FOLDER name ] : "
read folder_name
echo "\n"
echo -n "[+] [ Enter the hidden service NEW FOLDER name ] : "
read folder_name_new
echo  "---------------------------------------------------------------------"
echo "\n"
echo "[*] Run time: $(date) @ $(hostname)" | lolcat -p 1
echo "\n"
echo -n "[*] Reactivating $folder_name" | lolcat -a --duration 10 -s 5 -p 1
mv $folder_name $folder_name_new
echo "\n"
;;
'tordomain deactivate')
echo  "\n---------------------------------------------------------------------"
echo -n "[+] [ Enter the hidden service FOLDER name ] : "
read folder_name
echo  "---------------------------------------------------------------------"
echo "\n"
echo "[*] Run time: $(date) @ $(hostname)" | lolcat -p 1
echo "\n"
echo -n "[*] Deactivating $folder_name" | lolcat -a --duration 10 -s 5 -p 1
new="${folder_name}_deactivated"
mv $folder_name $new
echo "\n"
;;
'tordomain update')
echo "\n"
echo -n "Available Version : "$updateVersion | lolcat -a --duration 5 -s 5 -p 1
echo "\n"
echo -n "Current Version   : "$currentVersion | lolcat -a --duration 5 -s 5 -p 1

if [ $updateVersion \> $currentVersion ] 
then
    echo "\n\nUpdating tor terminal files\n"
    mkdir 'newupdate'
    printf "#####                     (33%%)\r" | lolcat -a --duration 10 -s 6 -p 1
    cd 'newupdate'
    printf "#############             (66%%)\r" | lolcat -a --duration 10 -s 6 -p 1
    wget 'https://raw.githubusercontent.com/Kalihackz/tor_website_domian_generator/main/torterminal.sh'
    printf "#######################   (100%%)\r" | lolcat -a --duration 10 -s 6 -p 1
    chmod +x 'torterminal.sh'
elif [ $updateVersion \< $currentVersion ]
then
    echo "\n\nUse official github tor terminal version not unofficial versions"
else
    echo "\n\nYou are already using latest tor terminal version"
fi

echo "\n"
;;
*) echo "\nPlease type 'help' for commands list\n"
echo "==================================================================================="
echo "+ clear                - to clear the tor terminal                                +"
echo "+ tordomain activate   - to generate a random domain                              +"
echo "+ tordomain list       - to list all domain (active and inactive)                 +" 
echo "+ tordomain start      - to start a hidden service on the domain                  +"
echo "+ tordomain deactivate - to deactivate domain and make backup     \033[0;31m[not so useful]\033[0m +"
echo "+ tordomain reactivate - to reactivate domain                     \033[0;31m[not so useful]\033[0m +"
echo "+ tordomain delete     - to delete domain files                                   +"
echo "+ tordomain update     - to update tor files                       [coming soon]  +" 
echo "+ exit                 - exit the tor terminal                                    +" 
echo "===================================================================================\n"

;;
esac

done