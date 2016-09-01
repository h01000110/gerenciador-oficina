#!/bin/bash
#
# Gerenciador de Oficina
# Adicionar Cliente 1.6
# by: hi
# http://h01000110.github.io
# @h01000110
#
mkdir -p .clientes.d

dialog --ok-label "Inserir" \
	--backtitle "Gerenciador de Oficina" \
	--title "Adicionar Cliente" \
	--form "Insira os dados abaixo:\n* Todos os campos são obrigatórios\n* Formato da data: (CERTO - 10032016) (ERRADO - 10/03/2016)" \
	15 80 0 \
	"Nome:" 1 1	"" 1 23 50 0 \
	"Telefone:" 2 1 "" 2 23 20 0 \
	"Veículo:" 3 1 "" 3 23 50 0 \
	"Placa:" 4 1 "" 4 23 15 0 \
	"Data de Entrada:" 5 1 "" 5 23 20 0 \
	"Data Estimada:" 6 1 "" 6 23 20 0 \
	"Preço:" 7 1 "R$" 7 23 20 0 \
	2>/tmp/.cliente

if [ $? = 0 ]; then
	ARQNOM=`cat /tmp/.cliente | head -1 | tail -1`
	ARQTEL=`cat /tmp/.cliente | head -2 | tail -1`
	ARQVEI=`cat /tmp/.cliente | head -3 | tail -1`
	ARQPLA=`cat /tmp/.cliente | head -4 | tail -1`
	ARQENT=`cat /tmp/.cliente | head -5 | tail -1`
	ARQSAI=`cat /tmp/.cliente | head -6 | tail -1`
	ARQPRE=`cat /tmp/.cliente | head -7 | tail -1`
	identidade=`cat .id.d/.identidade`

	if [ $ARQNOM = ] || [ $ARQTEL = ] || [ $ARQVEI = ] || [ $ARQPLA = ] || [ $ARQENT = ] || [ $ARQSAI = ] || [ $ARQPRE = R$ ]; then
		rm /tmp/.cliente
		dialog --backtitle "Gerenciador de Oficina" --title "Adicionar Cliente" --infobox "Preenha todos os campos!" 0 0
		sleep 2
		dialog --backtitle "Gerenciador de Oficina" --title "Adicionar Cliente" --yesno "Voltar ao menu?" 0 0 && . lancador.sh
		sleep 2
		. clientes.sh
	else
		mv /tmp/.cliente .clientes.d/"$identidade"-"$ARQPLA"-"$ARQNOM".db
		dialog --backtitle "Gerenciador de Oficina" --title "Adicionar Clientes" --infobox "Cliente adicionado com sucesso!" 0 0
		sleep 2
		. lancador.sh
	fi
else
	rm /tmp/.cliente
	sleep 1
	. lancador.sh
fi
