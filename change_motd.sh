#!/bin/bash

# name of directory the script will operate
motd_dir="/etc/ircd-hybrid";

# server info to be displayed
server_name="ANTIBIOTICS' IRC";
server_admin="Antibiotics";
admin_email="abx@abx.pe.kr";

# rename old motd file to date + .old format
for file_list in "$motd_dir"/*; do
        file_name=$(basename -- "$file_list");
        file_ext="${file_name##*.}";
        file_name="${file_name%.*}";
        if [ $file_ext == "motd" ]; then
                file_path=$file_list;
                motd_file_name=$file_name;
                date=$(date '+%Y-%m-%d');
                mv "$file_list" "${file_list}.old.${date}";
        fi;
done;

# select daily random ascii art
arts[0]="
 __      _____________.____   _________  ________      _____  ___________
/  \    /  \_   _____/|    |  \_   ___ \ \_____  \    /     \ \_   _____/
\   \/\/   /|    __)_ |    |  /    \  \/  /   |   \  /  \ /  \ |    __)_ 
 \        / |        \|    |__\     \____/    |    \/    Y    \|        \
  \__/\  / /_______  /|_______ \______  /\_______  /\____|__  /_______  /
       \/          \/         \/      \/         \/         \/        \/ 
";
arts[1]="
Y88b         / 888~~  888      e88~-_    ,88~-_        e    e      888~~  
 Y88b       /  888___ 888     d888   \  d888   \      d8b  d8b     888___ 
  Y88b  e  /   888    888     8888     88888    |    d888bdY88b    888    
   Y88bd8b/    888    888     8888     88888    |   / Y88Y Y888b   888    
    Y88Y8Y     888    888     Y888   /  Y888   /   /   YY   Y888b  888    
     Y  Y      888___ 888____  88_-~     88_-~   /          Y888b 888___  
";
arts[2]="
 __          ________ _      _____ ____  __  __ ______ 
 \ \        / /  ____| |    / ____/ __ \|  \/  |  ____|
  \ \  /\  / /| |__  | |   | |   | |  | | \  / | |__   
   \ \/  \/ / |  __| | |   | |   | |  | | |\/| |  __|  
    \  /\  /  | |____| |___| |___| |__| | |  | | |____ 
     \/  \/   |______|______\_____\____/|_|  |_|______|

";

arts_size=${#arts[@]};
selected_art=$(($RANDOM % $arts_size));

# select daily random comments
comment[0]="Absence makes the heart grow fonder";
comment[1]="Actions speak louder than words";
comment[2]="A journey of a thousand miles begins with a single step";
comment[3]="A picture is worth a thousand words";
comment[4]="All good things must come to an end";
comments_size=${#comment[@]};
selected_comment=$(($RANDOM % $comments_size));

# puts contents to file

file_contents="
${arts[$selected_art]}
___________________________________________________________________________________

Welcome to ${server_name}!

Server Administrator: ${server_admin}
CONTACT: ${admin_email}

Today's comment '${comment[$selected_comment]}'
";

echo "$file_contents" > "$file_path";

# restart ircd-hyrid server

/etc/init.d/ircd-hybrid restart;