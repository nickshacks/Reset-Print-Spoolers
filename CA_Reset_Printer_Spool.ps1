#set your first argument as $computer 
$computer = "ca-print.bayley.net" 

#Stop the service: 
Get-WmiObject -Class Win32_Service -Filter 'name="spooler"' -ComputerName $computer | Invoke-WmiMethod -Name StopService | out-null 

#Delete all items in: C:\windows\system32\spool\printers on the remote computer 

#the `$ is the escape charater to make sure powershell sees the $ as a charater rather than a variable 
Get-ChildItem "\\$computer\C`$\windows\system32\spool\printers" | Remove-Item 

#Start the service 
Set-Service spooler -ComputerName $computer -status Running