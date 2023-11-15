#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Creating new directories"

new_directories=("Public" "Adm" "Sellers" "Secretaries")

for dir in "${new_directories[@]}"; do
    mkdir /home/$dir
done

echo "Creating new groups"

new_groups=("GRP_ADM" "GRP_SELL" "GRP_SEC")

for group in "${new_groups[@]}"; do
    groupadd $group
done

echo "Add new users"

password_adm=$(openssl passwd -1 "password")
users_adm=("carlos" "maria" "joao")
for user in "${users_adm[@]}"; do
    useradd -d /home/Adm -G GRP_ADM -p $password_adm $user
done

password_sell=$(openssl passwd -1 "password")
users_sell=("debora" "sebastiana" "roberto")
for user in "${users_sell[@]}"; do
    useradd -d /home/Sellers -G GRP_SELL -p $password_sell $user
done

password_sec=$(openssl passwd -1 "password")
users_sec=("josefina" "amanda" "roderio")
for user in "${users_sec[@]}"; do
    useradd -d /home/Secretaries -G GRP_SEC -p $password_sec $user
done

# Set ACL for the "Adm" directory
setfacl -d -m u:carlos:rwx /home/Adm
setfacl -d -m u:maria:rwx /home/Adm
setfacl -d -m u:joao:rwx /home/Adm

# Remove permissions for other directories
setfacl -x u:carlos /home/Sellers /home/Secretaries
setfacl -x u:maria /home/Sellers /home/Secretaries
setfacl -x u:joao /home/Sellers /home/Secretaries

# Set ACL for the "Sellers" directory
setfacl -d -m u:debora:rwx /home/Sellers
setfacl -d -m u:sebastiana:rwx /home/Sellers
setfacl -d -m u:roberto:rwx /home/Sellers

# Remove permissions for other directories
setfacl -x u:debora /home/Adm /home/Secretaries
setfacl -x u:sebastiana /home/Adm /home/Secretaries
setfacl -x u:roberto /home/Adm /home/Secretaries

# Set ACL for the "Secretaries" directory
setfacl -d -m u:josefina:rwx /home/Secretaries
setfacl -d -m u:amanda:rwx /home/Secretaries
setfacl -d -m u:roderio:rwx /home/Secretaries

# Remove permissions for other directories
setfacl -x u:josefina /home/Adm /home/Sellers
setfacl -x u:amanda /home/Adm /home/Sellers
setfacl -x u:roderio /home/Adm /home/Sellers

echo "... The End ..."

