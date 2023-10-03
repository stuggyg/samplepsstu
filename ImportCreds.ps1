#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
    
#Config Parameters
$SiteUrl = "http://sp2019/sites/DemoSiteCol/"
$ListName= "SugLib"


$credPath = 'C:\secretfile.txt'  
$fileCred = Import-Clixml -path $credpath  

$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$ctx.Credentials = New-Object System.Net.NetworkCredential($fileCred.UserName, $fileCred.Password)
#$Cred = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($fileCred.UserName, $fileCred.Password)

#$Cred = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($fileCred.UserName, $fileCred.Password)  