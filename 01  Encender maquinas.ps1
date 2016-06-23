#
# Encender Maquina
# http://www.mundosql.es/
#

Clear

# Login
Login-AzureRmAccount 
Select-AzureRMSubscription -SubscriptionName "Visual Studio Enterprise"
#Select-AzureRMSubscription -SubscriptionName "BizSpark"

# Grupo de Recursos
$rgName = 
    ( get-azurermvm | 
        Out-GridView `
          -Title "Selecciona Grupo de Recursos ..." `
          -PassThru
    ).ResourceGroupName
Write-Host("GR: ",$rgName) -ForegroundColor Yellow

# encender MV
$vmName = 
    ( get-azurermvm | 
        Out-GridView `
          -Title " Encender MV ..." `
          -PassThru
    ).Name
Write-Host("Maquina: ",$vmName) -ForegroundColor Yellow

#Encender maquina
Start-AzureRmVM -ResourceGroupName $rgName -Name $vmName -Verbose
Write-Host("MV Encendida") -ForegroundColor Yellow