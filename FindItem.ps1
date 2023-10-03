$data = @('Zero','One','Two','Three')

$choice = Read-Host  "type one of the following:  " $data
$setFound = $false

# Initialize the loop
for ($i = 0; $i -lt $data.Length; $i++)
{

    if($choice -eq $data[$i] ){
        # Output the current item
        Write-Host "FOUND" $data[$i]
        $setFound = $true
        break
    }
   

    
}

if(-not $setFound){
        Write-Host "Not Found"
    }