#!/bin/bash
set -e
clear

if [[ "$UID" -ne 0 ]]; then
	echo "You need to be root!"
	sleep 1
	echo "!!!STUPID!!!"
	sleep 2
	exit
fi

echo -e "Hello \nWelcome to the installer basic environment for php developers."
echo -en "Preparing to add new repositories"; sleep 1; echo -en "."; sleep 1; echo -en "."; sleep 1; echo -e "."; sleep 1;

	echo -e "\n---Adding Sublime Text 2 repository---\n"
		add-apt-repository ppa:webupd8team/sublime-text-2
	echo -e "\n---Adding Skype repository---\n"
		add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
	echo -e "\n---Adding Google repository---\n"
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
		sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
	echo -e "\n---Adding SoapUI repository---\n"
		add-apt-repository ppa:upubuntu-com/web
	echo -e "\n---Adding Mysql Workbench repository---\n"
		add-apt-repository ppa:olivier-berten/misc

clear
echo -en "Preparing to update repository list"; sleep 1; echo -en "."; sleep 1; echo -en "."; sleep 1; echo -e ".";
apt-get update

echo "Repository list updated successfully."
echo -en "Preparing to update repository list"; sleep 1; echo -en "."; sleep 1; echo -en "."; sleep 1; echo -e ".";

echo -e "\n---Install LAMP---\n"
apt-get install lamp-server^ -y
echo -e "\n---Install Sublime Text---\n"
apt-get install sublime-text -y
echo -e "\n---Install Skype---\n"
apt-get install skype -y
echo -e "\n---Install Chrome---\n"
apt-get install google-chrome-stable -y
#echo -e "\n---Install SoapUI---\n"
#apt-get install soapui
echo -e "\n---Install Mysql Workbench---\n"
apt-get install mysql-workbench -y
echo -e "\n---Install Meld---\n"
apt-get install meld -y
echo -e "\n---Install GIT---\n"
apt-get install git -y
echo -e "Type your git user name"
read USER
echo -e "Type your git e-mail"
read MAIL
echo -en "Registering user $USER, please wait"; sleep 1; echo -en "."; sleep 1; echo -en "."; sleep 1; echo -e ".";
git config --global user.name "$USER"
git config --global user.email "$MAIL"
git config --global merge.tool meld
echo -e "\n---Install GIT flow---\n"
apt-get install git-flow -y

echo " \o/ \o/ \o/ \o/ \o/ \o/ \o/ \o/ \o/ \o/ \o/ \o/ \o/ \o/ \o/ "
echo "Congratulations your installation was completed successfully."
