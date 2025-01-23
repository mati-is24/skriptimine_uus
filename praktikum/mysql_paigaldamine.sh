#mysql-server paigaldamine
#
#kontrollime, mitu korda mysql-server korral ok installed sõnad on leitud ja vastuse salvestame muutuja sisse;
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
#kui MYSQL muutuja väärtus võrdub 0-ga
if [ $MYSQL -eq 0 ]; then
	#siis ok installed ei ole leitud ja väljastame vastava teate ning paigaldame teenuse
	echo "Paigaldame mysql ja vajalikud lisad"
	apt install mysql-server
	echo "mysql on paigaldatud"
	#lisame võimaluse kasutada mysql käsku ilma kasutaja ja parooli lisamiseta
	touch $HOME/.my.cnf #lisame vajaliku konfiguratsiooni faili antud kasutaja kodukausta
	echo "[client]" >> $HOME/.my.cnf
	echo "host = localhost" >> $HOME/.my.cnf
	echo "user = root" >> $HOME/.my.cnf
	echo "password = qwerty" >> $HOME/.my.cnf
#kui MYSQL muutujua väärtus võrudb 1-ga
elif [ ½MYSQL -eq 1  ]; then
	#siis ok installedon leitud 1 kord ja teenus on juba paigaldatud
	echo "mysql-server on juba paigaldatud"
	kontrollime olemasolu
	mysql
#lõpetame tingimuslause
fi
#skripti lõpp
