#!/bin/bash
#
# GNU/Linux - ©WHITE HACKS
# GPL - General Public License
# Open Source - Software Libre
#
# ┌═════════════┐  ┌════════════┐
# █ termux-ruby █=>█ 18/04/2021 █
# └═════════════┘  └════════════┘
#
# ===============================================
#                   VARIABLES
# ===============================================
PWD=$(pwd)
SYSTEM=$(uname -o)
ARCH=$(uname -m)
BIN="/data/data/com.termux/files/usr/bin"
# ===============================================
#               COLORES RESALTADOS
# ===============================================
negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"
# ===============================================
#                 COLORES BAJOS
# ===============================================
black="\e[0;30m"
blue="\e[0;34m"
green="\e[0;32m"
cyan="\e[0;36m"
red="\e[0;31m"
purple="\e[0;35m"
yellow="\e[0;33m"
white="\e[0;37m"
# ===============================================
#            VERIFICANDO DEPENDENCIAS
# ===============================================
Architecture(){
	if [ "${SYSTEM}" == "Android" ]; then
		if [ ! -x ${BIN}/curl ]; then
			yes|pkg update && pkg upgrade
			yes|pkg install curl
		fi
		if [ -x ${BIN}/ruby ]; then
			yes|pkg uninstall ruby
		fi
		if [ "${ARCH}" == "aarch64" ]; then
			DEB="ruby_aarch64.deb"
		elif [ "${ARCH}" == "i686" ]; then
			DEB="ruby_i686.deb"
		elif [ "${ARCH}" == "x86_64" ]; then
			DEB="ruby_x86_64.deb"
		else
			DEB="ruby_arm.deb"
		fi
	else
echo -e "${negro}
┌═════════════════════════════════┐
█ ${rojo}SISTEMA OPERATIVO NO COMPATIBLE ${negro}█
└═════════════════════════════════┘
"${blanco}
exit
	fi
}
# ===============================================
#            BANNER DE TEXTO RUBY 2.7.2
# ===============================================
Ruby(){
	sleep 0.5
	clear
echo -e "${negro}
██████╗ ██╗   ██╗██████╗ ██╗   ██╗    ${verde}██████╗ ███████╗ ██████╗${negro}
██╔══██╗██║   ██║██╔══██╗╚██╗ ██╔╝    ${verde}╚════██╗╚════██║ ╚════██╗${negro}
██████╔╝██║   ██║██████╔╝ ╚████╔╝      ${verde}█████╔╝    ██╔╝  █████╔╝${negro}
██╔══██╗██║   ██║██╔══██╗  ╚██╔╝      ${verde}██╔═══╝    ██╔╝  ██╔═══╝${negro}
██║  ██║╚██████╔╝██████╔╝   ██║       ${verde}███████╗██╗██║██╗███████╗${negro}
╚═╝  ╚═╝ ╚═════╝ ╚═════╝    ╚═╝       ${verde}╚══════╝╚═╝╚═╝╚═╝╚══════╝
"${blanco}
}
# ===============================================
#              INSTALANDO RUBY 2.7.2
# ===============================================
Installation(){
	Ruby
	yes|pkg update && pkg upgrade
	cp deb/${DEB} .
	mv ${DEB} ruby.deb
	apt-mark unhold ruby
	apt install -y ./ruby.deb
	apt-mark hold ruby
	curl -LO https://raw.githubusercontent.com/Darkmux/termux-msf/main/fix-ruby-bigdecimal.sh.txt
	bash fix-ruby-bigdecimal.sh.txt
	rm ruby.deb
echo -e "${negro}
┌════════════════════════┐
█ ${verde}PAQUETE RUBY INSTALADO ${negro}█
└════════════════════════┘
"${blanco}
}
# ===============================================
#              DECLARANDO FUNCIONES
# ===============================================
Architecture
Installation
# ===============================================
#     Creado por Darkmux - WHITE HACKS ©2021
# ===============================================
