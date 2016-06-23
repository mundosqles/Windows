#
# Encender Maquina
# http://www.mundosql.es/
#

Clear

# Login
Login-AzureRmAccount 
Select-AzureRMSubscription -SubscriptionName "Visual Studio Enterprise"
#Select-AzureRMSubscription -SubscriptionName "BizSpark"

#Maquinas encendidas
Get-AzureRmVM -ResourceGroupName $rgName | get-azurermvm -Status | ?{$_.statuses.displaystatus -eq "VM running"} | select name

# encender MV
$vmName = 
    ( get-azurermvm | 
        Out-GridView `
          -Title " Apagar MV ..." `
          -PassThru
    ).Name
Write-Host("Apagando Maquina: ",$vmName) -ForegroundColor Yellow

#Encender maquina
Stop-AzureRmVM -ResourceGroupName $rgName -Name $vmName -Verbose
Write-Host("MV Apagada") -ForegroundColor Yellow