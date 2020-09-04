#CREATED BY: Evelina.forsberg@se.abb.com
#CREATED DATE: 2018-10-20
#TITLE: Export-IMlogs
#DESCRIPTION: Export multiple object with property from log to textfiles. 
#

#Get content from the CSV file with "Object:Property,Log" exampele "G54_PV4224_DRT1:HSI.value,L3_1m_1y"
foreach ($line in Get-Content -Path C:\LOMA\KORRIGERADE.csv)
{
   $ObjectName, $numOfDays = $line -split ';'
   write-host Got $objectName
   write-host got $numOfDays
   write-host Running sql query... 

   #SQL Credentials_______________|__________|_Different Credentials on site
   $output = (cmd /c "sqlplus.exe /@localhost @query $objectName $numOfDays")  | out-string
   clear
   
   $filename = $ObjectName.Replace(":","-")
   $filename = $filename.Replace(",","-")
   write-host filename is $filename 
   write-output "$output " |Sort-Object | out-file -filepath "$filename.txt" 
   
   start-sleep 5
   
   write-host Deleting lines
# Editing the text output-file. Remove the unncessesary SQL-lines in start and end    
   $GC = get-content "$filename.txt"
   ($GC | select-object -skip 7) | set-content "$filename.txt"

	$GC1 = get-content "$filename.txt"
  	$gc1[2..($gc1.count-5)] | set-content "$filename.txt"
  
   start-sleep 10
} 
write-host done...