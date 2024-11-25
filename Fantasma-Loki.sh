#!/bin/bash

# Author: Angel Del Villar
# GitHub: github.com/Angel-iluminaty
# Loki is a Bash script that creates masked phishing URLs by combining shortened links with legitimate-looking domains and optional keywords.

# Foreground Color
red="\e[31m"
green="\e[32m"
yellow="\e[33m"

# Text Format
normal="\e[0m"
bold="\e[1m"
faint="\e[2m"
italics="\e[3m"
underlined="\e[4m"

clear

echo -e "${white}
 @@@        @@@@@@   @@@  @@@  @@@
 @@@       @@@@@@@@  @@@  @@@  @@@
 @@!       @@!  @@@  @@!  !@@  @@!
 !@!       !@!  @!@  !@!  @!!  !@!
 @!!       @!@  !@!  @!@@!@!   !!@${green}
 !!!       !@!  !!!  !!@!!!    !!!
 !!:       !!:  !!!  !!: :!!   !!:
  :!:      :!:  !:!  :!:  !:!  :!:
  :: ::::  ::::: ::   ::  :::   ::
 : :: : :   : :  :    :   :::  :
${normal}"

echo -e "${green}${bold}      Fantasma-Loki ${normal}by Angel De Villar"
echo -e " GitHub: ${underlined}https://github.com/Angel-iluminaty${normal}\n"

# Function to validate URL
url_checker() {
    [[ "$1" =~ ^https?:// ]] || { echo "[!] URL no válida. Utilice http o https."; exit 1; }
}

# Input: Phishing URL
read -p "Phishing URL: " phish
url_checker "$phish"

# Shorten URL
short=$(curl -s "https://is.gd/create.php?format=simple&url=${phish}")
shorter=${short#https://}

# Input: Masking domain
read -p "Dominio de enmascaramiento: " mask
url_checker "$mask"

# Input: Social engineering words
read -p "Palabras Claves: " words

# Validate and generate final URL
[[ "$words" =~ " " ]] && { echo "[!] Palabras no válidas. Por favor evita espacios."; words=""; }
final="${mask}${words:+-$words}@$shorter"
echo -e "\nURL enmascarada:${green} $final\n${CLEAR}"
