#!/bin/bash
#
# Gerenciador de Oficina
# IDcliente 1.6
# by: hi
# http://h01000110.github.io
# @h01000110
#
mkdir -p .id.d
touch .id.d/.identidade
fonte=`cat .id.d/.identidade`
if [ -z $fonte ]; then
	echo 1 > .id.d/.identidade
else
	echo $(($fonte+1)) > .id.d/.identidade
fi
