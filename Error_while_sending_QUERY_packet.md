# Query: 
I was trying to insert some data into the database but i got this error "Error while sending QUERY packet"
* $insertDeta = $conPat->prepare("insert into table1(data) VALUES(:data)");
* $insertDeta->bindParam(':data',$data);
* $conPat->beginTransaction();
    * $insertDeta->execute();
* $conPat->commit();

but what i think the problem is that size of the data is over 16MB.
the data type of the column is set as longtext, which i think can keep data as big as 4GB.


I dont know if PDOs is having problems running the query or transfering 16MB of data to the database.
Thats the only guess i can make as mysql might send the data in packets and the packet cannot hold data as large as 16MB.
- - - -

# Answer:
1. You guessed right MySQL have limitation for size of data, you need to break your query in small group of records or you can Change your max_allowed_packet by using SET            GLOBAL max_allowed_packet=524288000;
2. 
   You can solve this problem by following few steps:

   1. open your terminal window

   1. please write following command in your terminal
      * ssh root@yourIP port
      * Enter root password
      
   1. Now edit your server my.cnf file using below command
      1.nano /etc/my.cnf
      * if command is not recognized do this first or try vi then repeat: yum install nano.
         OR
      * vi /etc/my.cnf 
         
   1. Add the line under the [MYSQLD] section. :

      * max_allowed_packet=524288000 (obviously adjust size for whatever you need) 
      * wait_timeout = 100
      
   1. Control + O (save) then ENTER (confirm) then Control + X (exit file)

   1. Then restart your mysql server by following command

      * /etc/init.d/mysql stop
      * /etc/init.d/mysql start
      
   1. You can verify by going into PHPMyAdmin or opening a SQL command window and executing:

      * **SHOW VARIABLES LIKE 'max_allowed_packet'**
      
   This works for me. I hope it should work for you.
3. Had such a problem when executing forking in php for command line. In my case from time to time the php killed the child process. To fix this, just wait for the process to      complete using the command pcntl_wait($status);
   here's a piece of code for a visual example:
   ```
         #!/bin/php -n
         <?php
         error_reporting(E_ALL & ~E_NOTICE);
         ini_set("log_errors", 1);
         ini_set('error_log', '/media/logs/php/fork.log');
         $ski = substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyz", 5)), 0, 5);
         error_log(getmypid().' '.$ski.' start my php');

         $pid = pcntl_fork();
         if($pid) {
         error_log(getmypid().' '.$ski.' start 2');
         // Wait for children to return. Otherwise they 
         // would turn into "Zombie" processes
         // !!!!!! add this !!!!!!
         pcntl_wait($status);
         // !!!!!! add this !!!!!!
         } else {
         error_log(getmypid().' '.$ski.' start 3');
         //[03-Apr-2020 12:13:47 UTC] PHP Warning:  Error while sending QUERY packet. PID=18048 in /speed/sport/fortest.php on line 22457
         mysqli_query($con,$query,MYSQLI_ASYNC);
         error_log(getmypid().' '.$ski.' sleep child');
         sleep(15);
         exit;
         } 

         error_log(getmypid().' '.$ski.'end my php');
         exit(0);
         ?>
     ```
