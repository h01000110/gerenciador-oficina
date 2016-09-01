#!/bin/bash
#
# Gerenciador de Oficina
# Deletar Cliente 1.6
# by: hi
# http://h01000110.github.io
# @h01000110
#
dialog --backtitle "Gerenciador de Oficina" --title "Deletar Cliente" --fselect .clientes.d/ 0 80 2>/tmp/.delcliente
if [ $? = 0 ]; then
	sleep 1
	delcliente=`cat /tmp/.delcliente`
	sleep 1
	dialog --backtitle "Gerenciador de Oficina" --title "Deletar Cliente" \
		--yesno "Tem certeza disso?\n\nEste cadastro será deletado: ${delcliente:12}" 10 80
		if [ $? = 0 ]; then
			sleep 1
			dialog --backtitle "Gerenciador de Oficina" --title "Deletar Cliente" \
				--yesno "Quer fazer uma cópia de segurança?" 0 0
				if [ $? = 0 ]; then
					mkdir -p .backup.d
					mv "$delcliente" .backup.d/
					rm /tmp/.delcliente
					sleep 1
					. lancador.sh
				else
					rm "$delcliente"
					rm /tmp/.delcliente
					sleep 1
					. lancador.sh
				fi
		else
			rm /tmp/.delcliente
			sleep 1
			. lancador.sh
		fi
else
	rm /tmp/.delcliente
	sleep 1
	. lancador.sh
fi
