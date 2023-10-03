#Load SharePoint Online Assemblies
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
 
##Variables for Processing
$SiteUrl = "http://sp2019/sites/DemoSiteCol/"
$ListName= "SugLib"
$FieldName="Class2"
#Define Choices
$Choices = @("Sixa","Sevena","Eighta")
   
#Get Credentials to connect
#$Cred= Get-Credential
#$Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($Cred.Username, $Cred.Password)


$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)

$credentials = Get-Credential
$ctx.Credentials = $credentials
   
#Set up the context
#$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteUrl)
#$Ctx.Credentials = $Credentials
 
#Get the List
$List = $Ctx.Web.Lists.GetByTitle($ListName)
$Ctx.Load($List)
$Ctx.ExecuteQuery()
 
#Get the field
$Field = $List.Fields.GetByInternalNameOrTitle($FieldName)
$Ctx.Load($Field)
$Ctx.ExecuteQuery()
 
#Cast the field to Choice Field
$ChoiceField = New-Object Microsoft.SharePoint.Client.FieldMultiChoice($Ctx, $Field.Path)
$Ctx.Load($ChoiceField)
$Ctx.ExecuteQuery()
 
#$choiceField.Choices.Clear()
$ChoiceField.Choices = $Choices           
$ChoiceField.UpdateAndPushChanges($True)
$Ctx.ExecuteQuery()
 
Write-host "Choice Field has been Updated!" -ForegroundColor Green


#Read more: https://www.sharepointdiary.com/2017/03/sharepoint-online-update-choice-field-using-powershell.html#ixzz8EvuI1eGx