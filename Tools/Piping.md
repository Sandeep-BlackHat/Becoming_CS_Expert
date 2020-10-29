# Piping in Unix or Linux

Pipes are unidirectional i.e data flows from left to right through the pipeline.

**Syntax :**

command_1 | command_2 | command_3 | .... | command_N 

## 1. Listing all files and directories and give it as input to more command.

$ ls -l | more 

$ ls -l -> temp

## 2. Use sort and uniq command to sort a file and print unique values.

$ sort record.txt | uniq 

**This will sort the given file and print the unique values only.**

## 3. Use head and tail to print lines in a particular range in a file.

$ cat sample2.txt | head -7 | tail -5

**This command select first 7 lines through (head -7) command and that will be input to (tail -5) command which will finally print last 5 lines from that 7 lines.**

## 4. Use ls and find to list and print all lines matching a particular pattern in matching files.

$ ls -l | find ./ -type f -name "*.txt" -exec grep "program" {} \;

**This command select files with .txt extension in the given directory and search for pattern like “program” in the above example and print those ine which have program in them.**

## 5. Use cat, grep, tee and wc command to read the particular entry from user and store in a file and print line count.

$ cat result.txt | grep "Rajat Dua" | tee file2.txt | wc -l

**This command select Rajat Dua and store them in file2.txt and print total number of lines matching Rajat Dua**
