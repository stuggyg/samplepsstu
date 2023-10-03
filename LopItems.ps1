#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
    
#Config Parameters
$SiteURL="http://sp2019/sites/DemoSiteCol"
$ListName="SugLib"
   
#Setup Credentials to connect
#$Cred= Get-Credential
#$Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)
 
#Setup the context
#$Ctx = new NetworkCredential(@"domain\user", "password");
#$Ctx.Credentials = $Credentials  


$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)

$credentials = Get-Credential
$ctx.Credentials = $credentials
    
#Get the List
$List=$Ctx.Web.Lists.GetByTitle($ListName)
 
#Get All List items
$ListItems = $List.GetItems([Microsoft.SharePoint.Client.CamlQuery]::CreateAllItemsQuery())
$Ctx.Load($ListItems)
$Ctx.ExecuteQuery()
 
Write-host "Total Number of List Items found:"$ListItems.count
 
#sharepoint online powershell loop through list items
Foreach ($Item in $ListItems)
{
    #Get the List Item's Title
    Write-host $Item["FileLeafRef"]
}