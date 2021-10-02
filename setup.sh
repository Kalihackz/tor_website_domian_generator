banner() {
clear
echo "
  ____       _                 _____ ___  ____   __        __   _     
 / ___|  ___| |_ _   _ _ __   |_   _/ _ \|  _ \  \ \      / /__| |__  
 \___ \ / _ \ __| | | | '_ \    | || | | | |_) |  \ \ /\ / / _ \ '_ \ 
  ___) |  __/ |_| |_| | |_) |   | || |_| |  _ <    \ V  V /  __/ |_) |
 |____/ \___|\__|\__,_| .__/    |_| \___/|_| \_\    \_/\_/ \___|_.__/ 
                      |_|                                             
                                                "| lolcat -p 1
echo "		                  - A Tor Website Setup file for all\n"| lolcat -p 1
echo "		                                Version : Bash Final\n"| lolcat -p 1
echo "		                                        By Kalihackz\n"| lolcat -p 1
}

banner

echo -n "[+] [ Enter the hidden service FOLDER name ] : " | lolcat -p 1
read folder_name

echo -n "[+] [ Enter the hidden service PORT ] : " | lolcat -p 1
read port

mkdir "$folder_name"

echo "HiddenServiceDir $(pwd)/$folder_name
HiddenServicePort 80 127.0.0.1:$port" > torrc

echo "\n"
echo -n "[*] Please close this script after it shows 'Bootstrapped 100% (done): Done' at last" | lolcat -a --duration 10 -s 5 -p 1

echo "\n"
echo -n "[*] Writing  and starting default tor config file ---> tor -f torrc" | lolcat -a --duration 10 -s 5 -p 1

chmod 700 $folder_name

tor -f torrc
