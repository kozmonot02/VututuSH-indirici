#!/bin/bash

####################################
#            Kozmonot02            #
####################################

#renk şeysi
    white="\033[1;37m"
    grey="\033[0;37m"
    purple="\033[0;35m"
    red="\033[1;31m"
    green="\033[1;32m"
    yellow="\033[1;33m"
    purple="\033[0;35m"
    cyan="\033[0;36m"
    cafe="\033[0;33m"
    fiuscha="\033[0;35m"
    blue="\033[1;34m"
    tp="\e[0m"
    black="\033[0;30m"
    
    
# ctrl+c ile çıkış
trap ctrl_c INT
ctrl_c() {
echo -e "\n"
echo -e "${blink}${yellow} kullandığınız için teşekkür ederim $tp"
exit 0
}



if [[ $USER = "root" ]] ; then
    echo "ok" &> /dev/null
else
    echo -e "$red sudo İle Deneyiniz."
    exit 1
fi
if [[ $1 =~ ^(-v|--version) ]] ; then
    echo "$version v1t1"   
fi
# yükleme şeysi
spinlong ()
{
    bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.2
    done
    echo -e "[${red}OK${tp}]"
}

#arayüz yüklemesi
spinlong

#arayüz
echo -e "$yellow 1-)$white Güncelleyici$yellow  2-)$white Şifre Oluşturucu"
echo ""
echo -e "$yellow 3-)$white Ram Bilgisi$yellow  4-)$white Sistem Bilgisi"
echo ""
echo -e "\n"
echo -ne "${red}Vututu${white} ${green}Script]➢ "   
read oku

#arayüz2

        case "$oku" in 
            1)
            if [[ -d vututuSH ]] ; then
                ok
            else
                clear
                echo -e $yellow "~~~~~~~~~~~~~~~ Güncelleyici İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/kozmonot02/vututuSH 
                spinlong
                echo -e $yellow "~~~~~~~~~~~~~~~ Güncelleyici Kuruldu ~~~~~~~~~~~~~~~$tp"
                cd vututuSH
                cd ..
                read -t 5 -n 1 -s -r -p "tıkla ve geç"

            fi
            clear
            cd vututuSH
            chmod +x güncelleyici.sh
            ./güncelleyici.sh
            cd ..
                ;;
            esac

if [[ $oku = "2" ]] ; then
clear
echo -ne "${purple}VututuRandomPassword"

 "${blue}SifreUzunlugunuzuBelirleyin=
 
read sayi

tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c $sayi  ; echo
fi

    if [[ $oku = "3" ]] ; then
clear
echo -e "${purple}RamBilgisi" 

free -m 

sudo lshw -short -C memory 

fi

if [[ $oku = "4" ]] ; then
clear
echo -e "${purple}SistemBilgisi"
lsb_release -a

# screenfetch zaten yuklu mu?
dpkg -l | grep screenfetch > /dev/null
if [ $? -eq 1 ]; then
    echo "Yukleme basliyor..."
   sudo apt install screenfetch -y
else
    echo " ✓ "
fi

screenfetch

fi