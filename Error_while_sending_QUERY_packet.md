- - - -
Ques: I was trying to insert some data into the database but i got this error "Error while sending QUERY packet"

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

# Answer
1. You guessed right MySQL have limitation for size of data, you need to break your query in small group of records or you can Change your max_allowed_packet by using SET            GLOBAL max_allowed_packet=524288000;
2. 
   You can solve this problem by following few steps:

   1. open your terminal window

   1. please write following command in your terminal
      1. ssh root@yourIP port
      1. Enter root password
      
   1. Now edit your server my.cnf file using below command
      1.nano /etc/my.cnf  
      if command is not recognized do this first or try vi then repeat: yum install nano.

      OR

      vi /etc/my.cnf 
   1. Add the line under the [MYSQLD] section. :

   max_allowed_packet=524288000 (obviously adjust size for whatever you need) 
   wait_timeout = 100
   6) Control + O (save) then ENTER (confirm) then Control + X (exit file)

   7) Then restart your mysql server by following command

   /etc/init.d/mysql stop
   /etc/init.d/mysql start
   8) You can verify by going into PHPMyAdmin or opening a SQL command window and executing:

   SHOW VARIABLES LIKE 'max_allowed_packet'
   This works for me. I hope it should work for you.
