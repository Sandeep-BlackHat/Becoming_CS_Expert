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
### 1. You guessed right MySQL have limitation for size of data, you need to break your query in small group of records or you can Change your max_allowed_packet by using SET            GLOBAL max_allowed_packet=524288000;
