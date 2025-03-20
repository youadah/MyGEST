DB_USER="sio"
DB_PASS="btsinfo"
DB_NAME="MyGest"
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
echo -e "Test des IP Actives" | figlet | lolcat
echo "Veillez patienter pendant que nous testons les IP..."
ip_list=$(mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -se "SELECT adIP FROM Equipement;")
if [ -z "$ip_list" ]; then
    echo "Aucune adresse IP trouvée dans la base de données." | lolcat
    exit 1
fi
for ip in $ip_list; do
    ping -c 1 -W 2 "$ip" &>/dev/null
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}L'adresse IP $ip est active.${NC}" | lolcat
    else
        echo -e "${RED}L'adresse IP $ip n'est pas active.${NC}" | lolcat
    fi
done
echo -e "Test terminé !" | figlet | lolcat
