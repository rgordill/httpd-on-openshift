#!/bin/bash

removelist="05-hardening-modules-remove.txt"

# Set the working directory to the directory of the script
cd "$(dirname "$0")"
echo "The working directory is now $(pwd)"

for file in /etc/httpd/conf.modules.d/*.conf; do
    # Get the filename without the path
    filename=$(basename "$file")

    # Copy file to destination folder
    cp "$file" "${HTTPD_MAIN_CONF_MODULES_D_PATH}/$filename"

    # # Perform the substitution
    # sed -i 's#modules/#/etc/httpd/modules/#g' "${HTTPD_MAIN_CONF_MODULES_D_PATH}/$filename"

    # Remove modules according with CIS rules
    while IFS= read -r line; do
        module=$(echo "$line" | cut -d' ' -f1)
        sed -i "/$module/d" "${HTTPD_MAIN_CONF_MODULES_D_PATH}/$filename"
    done < "$removelist"
done