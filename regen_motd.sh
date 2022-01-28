#!/bin/bash

# * motd_dir:
# directory where the motd file is located
# the default is /etc/ircd-hybrid

motd_dir="/etc/ircd-hybrid";

# * server_name: your irc server name
server_name=" ";

# * server_admin: server admin username
server_admin=" ";

# * admin_email: server admin email address
admin_email=" ";


date=$(date '+%Y-%m-%d');
for file_list in "$motd_dir"/*; do
    file_name=$(basename -- "$file_list");
    file_ext="${file_name##*.}";
    file_name="${file_name%.*}";
    if [ $file_ext == "motd" ]; then
        motd_not_found=false;
        file_path=$file_list;
        motd_file_name=$file_name;
        mv "$file_list" "${file_list}.old.${date}";
        break;
    fi;
    motd_not_found=true;
done;
if [ "$motd_not_found" = true ]; then
    file_path=$motd_dir"/ircd.motd";
fi;


styles[0]="
 __      _____________.____   _________  ________      _____  ___________
/  \    /  \_   _____/|    |  \_   ___ \ \_____  \    /     \ \_   _____/
\   \/\/   /|    __)_ |    |  /    \  \/  /   |   \  /  \ /  \ |    __)_
 \        / |        \|    |__\     \____/    |    \/    Y    \|        \

  \__/\  / /_______  /|_______ \______  /\_______  /\____|__  /_______  /
       \/          \/         \/      \/         \/         \/        \/

";
styles[1]="
Y88b         / 888~~  888      e88~-_    ,88~-_        e    e      888~~
 Y88b       /  888___ 888     d888   \  d888   \      d8b  d8b     888___
  Y88b  e  /   888    888     8888     88888    |    d888bdY88b    888
   Y88bd8b/    888    888     8888     88888    |   / Y88Y Y888b   888
    Y88Y8Y     888    888     Y888   /  Y888   /   /   YY   Y888b  888
     Y  Y      888___ 888____  88_-~     88_-~   /          Y888b 888___

";
styles[2]="
 __          ________ _      _____ ____  __  __ ______
 \ \        / /  ____| |    / ____/ __ \|  \/  |  ____|
  \ \  /\  / /| |__  | |   | |   | |  | | \  / | |__
   \ \/  \/ / |  __| | |   | |   | |  | | |\/| |  __|
    \  /\  /  | |____| |___| |___| |__| | |  | | |____
     \/  \/   |______|______\_____\____/|_|  |_|______|

";
styles[3]="
[..        [..[........[..          [..       [....     [..       [..[........
[..        [..[..      [..       [..   [..  [..    [..  [. [..   [...[..
[..   [.   [..[..      [..      [..       [..        [..[.. [.. [ [..[..
[..  [..   [..[......  [..      [..       [..        [..[..  [..  [..[......
[.. [. [.. [..[..      [..      [..       [..        [..[..   [.  [..[..
[. [.    [....[..      [..       [..   [..  [..     [.. [..       [..[..
[..        [..[........[........   [....      [....     [..       [..[........

";

quotes=( \
"Absence makes the heart grow fonder" \
"Actions speak louder than words" \
"A journey of a thousand miles begins with a single step" \
"A picture is worth a thousand words" \
"All good things must come to an end" \
);

styles_size=${#styles[@]};
selected_style=$(($RANDOM % $styles_size));
quotes_size=${#quotes[@]};
selected_quote=$(($RANDOM % $quotes_size));

file_contents="
${styles[$selected_style]}
___________________________________________________________________________________

Welcome to ${server_name}!

Server Administrator - ${server_admin}
CONTACT - ${admin_email}

Thought of the Day '${quotes[$selected_quote]}'
";

echo "$file_contents" > "$file_path";

/etc/init.d/ircd-hybrid restart;
