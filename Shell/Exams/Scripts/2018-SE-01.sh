#!/bin/bash

if [[ ${#} -ne 1 ]] ; then
        echo "Expected 1 argument"
        exit 1
fi

LOGDIR="${1}"

read -p "Enter protocol: " protocol
read -p "Enter account: " acc
read -p "Enter friend: " friend

mkdir -p "${LOGDIR}/${protocol}/${acc}/${friend}"

counter=0
date=$(date '+%Y-%m-%d-%H-%M-%S')
file="${LOGDIR}/${protocol}/${acc}/${friend}/${date}.txt"
touch "${file}"
while true ; do
        if [[ $(( counter % 2 )) -eq 0 ]] ; then
                current=${acc}
        else
                current=${friend}
        fi
        counter=$(( counter + 1 ))
        read -p "${current}: " message
        if [[ ${message} == "exit" ]] ; then
                exit 0
        fi
        echo "${current}: ${message}" >> ${file}
done

#Нека съществува програма за моментна комуникация (Instant messaging), която
#записва логове на разговорите в следния формат:
#9
#• има определена директория за логове (LOGDIR)
#• в нея има директорийна структура от следния вид:
#LOGDIR/протокол/акаунт/приятел/
#като на всяко ниво може да има няколко екземпляра от съответния вид, т.е. няколко директории протокол,
#във всяка от тях може да има няколко директории акаунт, и във всяка от
#тях – няколко директории приятел
#• във всяка от директориите приятел може да има файлове с имена от вида yyyy-mm-dd-hh-mm-ss.txt
#– година-месец-ден и т.н., спрямо това кога е започнал даден разговор
#• всеки такъв файл представлява лог на даден разговор със съответния приятел, като всяка
#разменена реплика между вас е на отделен ред
#• даден идентификатор приятел може да се среща няколко пъти в структурата (напр. през
#различни ваши акаунти сте водили разговори със същия приятел)
#Напишете скрипт, който приема задължителен позиционен аргумент - име на лог директория
#(LOGDIR). Скриптът трябва да извежда десетимата приятели, с които имате най-много редове
#комуникация глобално (без значение протокол и акаунт), и колко реда имате с всеки от тях.
#Опишете в коментар как работи алгоритъмът ви.