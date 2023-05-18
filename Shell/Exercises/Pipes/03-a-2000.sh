#С отделни команди, извадете от файл /etc/passwd:
#- първите 12 реда
#- първите 26 символа
#- всички редове, освен последните 4
#- последните 17 реда
#- 151-я ред (или друг произволен, ако нямате достатъчно редове)
#- последните 4 символа от 13-ти ред (символът за нов ред не е част от реда)

head /etc/passwd -n 12
head /etc/passwd -c 26
head /etc/passwd -n -4
tail /etc/passwd -n 17
head /etc/passwd -n 151 | tail -n 1
head /etc/passwd -n 13 | tail -n 1 | tail -c 5