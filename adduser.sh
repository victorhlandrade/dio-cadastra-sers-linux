#!/bin/bash

echo ""
echo " 		--------------------------"
echo " 		--- VALIDE SEU USUARIO ---"
echo " 		--------------------------"

echo ""

# Lista de nomes autorizados
colaboradores=("joao" "maria" "ana" "carlos")

# Solicita o nome
read -p "Digite o nome do colaborador: " nome

# Verifica se o nome está na lista
existe=false
for colaborador in "${colaboradores[@]}"; do
    if [[ "$colaborador" == "$nome" ]]; then
        existe=true
        break
    fi
done

# Se não estiver, sai
if [ "$existe" = false ]; then
    echo "Colaborador não autorizado ou inexistente."
    exit 1
fi

# Solicita senha
read -s -p "Digite a senha para o usuário $nome: " senha
echo

# Cria usuário com pasta home
useradd -m -s /bin/bash "$nome"

# Define senha
echo "$nome:$senha" | chpasswd

# Define permissões da pasta home
chown "$nome":"$nome" "/home/$nome"
chmod 700 "/home/$nome"

echo "Usuário $nome criado com sucesso."

echo ""

echo "		--------------------------------"
echo "		OBRIGADO POR USAR NOSSO SISTEMA!"
echo "		--------------------------------"
echo ""
