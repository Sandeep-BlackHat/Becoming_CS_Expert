Find Commands for Linux

kali@kali:~$ whatis find
kali@kali:~$ man find
kali@kali:~$ sudo find / -type f -name "proxychains.conf"
kali@kali:~$ sudo find / -type f -iname "proxychains.conf" #for disabling case sensitive wordings
kali@kali:~$ sudo find / -type f -name "*.conf" #all files with <.conf> extension will be displayed
kali@kali:~$ sudo find / -type f -perm 400 #all files with perimission defined will be displayed
kali@kali:~$ sudo find / -type f -name "proxychains.conf" -size +1K #basically sizes like 1024 K have to be written like 1024c in the command it's complusory
