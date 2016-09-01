#!/bin/bash
#
# Gerenciador de Oficina
# Clientes Cadastrados 1.6
# by: hi
# http://h01000110.github.io
# @h01000110
#
dialog --backtitle "Gerenciador de Oficina" --title "Clientes Cadastrados" --fselect .clientes.d/ 0 80 2>/tmp/.cadastro
if [ $? = 0 ]; then
	sleep 1
	vercadastro=`cat /tmp/.cadastro`
	dialog --backtitle "Gerenciador de Oficina" --title "Clientes Cadastrados" --textbox "$vercadastro" 15 80
	rm /tmp/.cadastro
	sleep 1
	dialog --backtitle "Gerenciador de Oficina" --title "Clientes Cadastrados" \
	--yesno "Ver outro cadastro?" 0 0 && sleep 1 && . cadastros.sh
	sleep 2
	. lancador.sh
else
	rm /tmp/.cadastro
	sleep 1
	. lancador.sh
fi
