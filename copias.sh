#!/bin/bash
#
# Gerenciador de Oficina
# Cópias de Segurança 1.6
# by: hi
# http://h01000110.github.io
# @h01000110
#
dialog --backtitle "Gerenciador de Oficina" --title "Cópias de Segurança" --fselect .backup.d/ 0 80 2>/tmp/.copia
if [ $? = 0 ]; then
	sleep 1
	vercopia=`cat /tmp/.copia`
	dialog --backtitle "Gerenciador de Oficina" --title "Cópias de Segurança" --textbox "$vercopia" 15 80
	sleep 1
	dialog --backtitle "Gerenciador de Oficina" --title "Cópias de Segurança" \
		--yesno "Restaurar esta cópia?\n\nNome do cadastro: ${vercopia:10}" 10 80
		if [ $? = 0 ]; then
			sleep 1
			mv "$vercopia" .clientes.d/
			rm /tmp/.copia
			sleep 1
			dialog --backtitle "Gerenciador de Oficina" --title "Cópias de Segurança" \
				--yesno "Ver outra cópia?" 0 0 && sleep 1 && . copias.sh
			sleep 2
			. lancador.sh
		else
			rm /tmp/.copia
			sleep 1
			dialog --backtitle "Gerenciador de Oficina" --title "Cópias de Segurança" \
				--yesno "Ver outra cópia?" 0 0 && sleep 1 && . copias.sh
			sleep 2
			. lancador.sh
		fi
else
	rm /tmp/.copia
	sleep 1
	. lancador.sh
fi
