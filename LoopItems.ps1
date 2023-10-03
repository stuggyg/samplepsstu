#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
    
#Config Parameters
$SiteUrl = "http://sp2019/sites/DemoSiteCol/"
$ListName= "SugLib"
   
#$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)

#$credentials = Get-Credential
#$ctx.Credentials = $credentials

$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$ctx.Credentials = New-Object System.Net.NetworkCredential($fileCred.UserName, $fileCred.Password)
 
#Setup the context
#$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
#$Ctx.Credentials = $Credentials
    
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
    #Write-host $Item["Title"]
    Write-host $Item["ID"]
    #Write-host $Item["Class2"]

    if ($Item["Class2"]){
    $Item["Class2"] + "hey"
    }
    if ($Item["PSA"]){
    $Item["PSA"] + "hey"
    }
    if ($Item["Classification"]){
    $Item["Classification"] + "hey"
    }
}


#Read more: https://www.sharepointdiary.com/2017/04/sharepoint-online-powershell-loop-through-list-items.html#ixzz8EvwXMnSs