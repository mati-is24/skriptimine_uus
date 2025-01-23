# phpmyadmin paigaldusskript

# kontrollime, mitu korda phpymadmin korral ok installed. sõnad on lietud ja vastuse salvestame muutuja sisse:
PMA=$(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c 'ok installed')
# kui PMA muutuja väärtus võrdug 0-ga
if [ $PMA -eq 0  ]; then
	#siis ok installed ei ole leitud ja väljastame vastava teate ning paigaldame teenuse
	echo "Paigaldame phpmyadmin ja vajalikud lisad"
	apt install mariadb-server mariadb-client -y
	apt install phpmyadmin -y
	echo "Phpmyadmin on paigaldatud"
# kui PMA muutuja võrudb 1-ga
elif [ $PMA -eq 1  ]; then
	#siis ok installed on leitud 1 kord ja teenus on juba paigaldatud
	echo "phpmyadmin on juba piagaldatud"
	#kontrollime olemasolu
#lõpetame tingimuslause
fi
#skripti lõpp
