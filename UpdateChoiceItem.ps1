#Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
 
##Variables for Processing
$SiteUrl = "http://sp2019/sites/DemoSiteCol/"
$ListName= "SugLib"
$FieldName="Class2"
$ItemID = 5
 
#Get credentials to connect
#$Cred = Get-Credential

$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)

$credentials = Get-Credential
$ctx.Credentials = $credentials
 
Try {
    #Setup the Context
    #$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
    #$Ctx.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.UserName, $Cred.Password)
 
    #Get the List Item to update
    $List = $Ctx.Web.Lists.GetByTitle($ListName)
    $ListItem = $List.GetItemById($ItemID)
    $Ctx.Load($ListItem)
    $Ctx.ExecuteQuery()
 
    #Update the value of Multiple Choices Field in the List Item
    $ListItem[$FieldName] = @("Sixa", "Sevana", "Eighta")
    $ListItem.Update()
    $Ctx.ExecuteQuery()
    Write-host -f Green "Choice Field Value has been updated for the list Item!"
    }
Catch {
    write-host -f Red "Error:" $_.Exception.Message
}


#Read more: https://www.sharepointdiary.com/2018/06/sharepoint-online-get-set-choice-field-value-using-powershell.html#ixzz8EvvpNJxe