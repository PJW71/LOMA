

 $output = (cmd /c "sqlplus.exe /@localhost @AskEvents")  | out-string
  
	write-host Running sql query... 

 write-output "$output " |out-file -filepath "AskEvent.txt" 
   
   start-sleep 5
   
 
   start-sleep 10

write-host done...
