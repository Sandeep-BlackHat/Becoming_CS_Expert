kali@kali:~$ echo $SHELL
kali@kali:~$ cat /etc/shells
kali@kali:~$ sh
kali@kali:~$ dash
kali@kali:~$ cat /etc/passwd | grep .bash
kali@kali:~$ chsh
     kali@kali:~$ /usr/bin/fish
kali@kali:~$ ls -alps | grep .bash
kali@kali:~$ whatis history
kali@kali:~$ cat .bash_history
kali@kali:~$ cat /dev/null > ~/.bash_history #Clearing history
kali@kali:~$ cat .bash_aliases
    #alias update = 'sudo apt-get update'
    #alias uprgade = 'sudo apt-get upgrade'
    #alias dist-upgrade = 'sudo apt-get dist-upgrade'
kali@kali:~$
