#!/bin/bash

read -p "String: " string

while [ ${#} -ne 0 ] ; do
        FILE=${1}
        shift
        echo "${FILE} - occurances: $(cat ${FILE} | grep -F "${string}" | wc -l)"
done

#Да се напише shell скрипт, който приема произволен брой аргументи - имена на файлове. Скриптът да прочита от стандартния вход символен низ и за всеки от зададените файлове извежда по подходящ начин на стандартния изход броя на редовете, които съдържат низа.
#
#NB! Низът може да съдържа интервал.