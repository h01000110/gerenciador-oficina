#!/bin/bash
#
# Gerenciador de Oficina
# Opções Avançadas 1.6
# by: hi
# http://h01000110.github.io
# @h01000110
#
opcoes=$( dialog --stdout --ok-label "Selecionar" --no-cancel \
	--backtitle "Gerenciador de Oficina" \
	--title "Opções Avançadas" \
	--menu "Escolha uma opção:" 0 80 0 \
	 1 "Cópias de Segurança" \
	 2 "Voltar ao Menu Principal" )

if [ $opcoes = 1 ]; then
	sleep 1
	. copias.sh
elif [ $opcoes = 2 ]; then
	sleep 1
	. lancador.sh
fi
