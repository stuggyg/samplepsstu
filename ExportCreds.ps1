$credentials = Get-Credential                                                                     
$filename = 'C:\secretfile.txt'  
$credentials | Export-Clixml -path $filename  