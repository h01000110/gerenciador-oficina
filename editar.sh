#!/bin/bash
#
# Gerenciador de Oficina
# Editar Cadastro 1.6
# by: hi
# http://h01000110.github.io
# @h01000110
#
dialog --backtitle "Gerenciador de Oficina" --title "Deletar Cliente" --fselect .clientes.d/ 0 80 2>/tmp/.editcaminho
if [ $? = 0 ];then
	sleep 1
	editcaminho=`cat /tmp/.editcaminho`
	cp "$editcaminho" /tmp/.editcliente

	nome=`cat /tmp/.editcliente | head -1 | tail -1`
	telefone=`cat /tmp/.editcliente | head -2 | tail -1`
	veiculo=`cat /tmp/.editcliente | head -3 | tail -1`
	placa=`cat /tmp/.editcliente | head -4 | tail -1`
	entrada=`cat /tmp/.editcliente | head -5 | tail -1`
	saida=`cat /tmp/.editcliente | head -6 | tail -1`
	preco=`cat /tmp/.editcliente | head -7 | tail -1`

	dialog --ok-label "Inserir" \
		--backtitle "Gerenciador de Oficina" \
		--title "Editar Cadastro" \
		--form "Insira os dados abaixo:\n* Todos os campos são obrigatórios\n* Formato da data: (CERTO - 10032016) (ERRADO - 10/03/2016)" \
		15 80 0 \
		"Nome:" 1 1	"$nome" 1 23 50 0 \
		"Telefone:" 2 1 "$telefone" 2 23 20 0 \
		"Veículo:" 3 1 "$veiculo" 3 23 50 0 \
		"Placa:" 4 1 "$placa" 4 23 15 0 \
		"Data de Entrada:" 5 1 "$entrada" 5 23 20 0 \
		"Data Estimada:" 6 1 "$saida" 6 23 20 0 \
		"Preço:" 7 1 "$preco" 7 23 20 0 2>/tmp/.editcliente

		if [ $? = 0 ]; then
			ARQNOM=`cat /tmp/.editcliente | head -1 | tail -1`
			ARQTEL=`cat /tmp/.editcliente | head -2 | tail -1`
			ARQVEI=`cat /tmp/.editcliente | head -3 | tail -1`
			ARQPLA=`cat /tmp/.editcliente | head -4 | tail -1`
			ARQENT=`cat /tmp/.editcliente | head -5 | tail -1`
			ARQSAI=`cat /tmp/.editcliente | head -6 | tail -1`
			ARQPRE=`cat /tmp/.editcliente | head -7 | tail -1`

			if [ $ARQNOM = ] || [ $ARQTEL = ] || [ $ARQVEI = ] || [ $ARQPLA = ] || [ $ARQENT = ] || [ $ARQSAI = ] || [ $ARQPRE = R$ ]
			then
				rm /tmp/.editcliente
				rm /tmp/.editcaminho
				dialog --backtitle "Gerenciador de Oficina" --title "Editar Cadastro" \
				--infobox "Preencha todos os campos!" 0 0
				sleep 2
				. editar.sh
			else
				cp /tmp/.editcliente "$editcaminho"
				rm /tmp/.editcliente
				rm /tmp/.editcaminho
				dialog --backtitle "Gerenciador de Oficina" --title "Editar Cadastro" \
				--infobox "Cadastro editado com sucesso!" 0 0
				sleep 2
				. lancador.sh
			fi
		else
			rm /tmp/.editcliente
			rm /tmp/.editcaminho
			sleep 1
			. editar.sh
		fi
else
	rm /tmp/.editcaminho
	sleep 1
	. lancador.sh
fi
