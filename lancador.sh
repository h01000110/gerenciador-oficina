#!/bin/bash
#
# Gerenciador de Oficina
# Lançador 1.6
# by: hi
# http://h01000110.github.io
# @h01000110
#
opcoes=$( dialog --stdout --ok-label "Selecionar" --no-cancel \
	--backtitle "Gerenciador de Oficina" \
	--title "Menu" \
	--menu "Escolha uma opção:" 0 80 0 \
	 1 "Clientes Cadastrados" \
	 2 "Adicionar Cliente" \
	 3 "Editar Cadastro" \
	 4 "Deletar Cliente" \
	 5 "Opções Avançadas" \
	 6 "Sair" )

if [ $opcoes = 1 ]; then
	sleep 1
	. cadastros.sh
elif [ $opcoes = 2 ]; then
	. idcliente.sh
	sleep 1
	. clientes.sh
elif [ $opcoes = 3 ]; then
	sleep 1
	. editar.sh
elif [ $opcoes = 4 ]; then
	sleep 1
	. deletar.sh
elif [ $opcoes = 5 ]; then
	sleep 1
	. opavancadas.sh
elif [ $opcoes = 6 ]; then
	dialog --backtitle "Gerenciador de Oficina" --title "Menu" --infobox "Fechando programa..." 0 0
	sleep 2
	clear
	exit
fi
