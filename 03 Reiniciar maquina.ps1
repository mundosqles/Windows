#
# Reiniciar Maquina
# http://www.mundosql.es/
#

Clear

# Reiniciar MV
$vmName = 
    ( get-azurermvm | 
        Out-GridView `
          -Title " Apagar MV ..." `
          -PassThru
    ).Name
Write-Host("Apagando Maquina: ",$vmName) -ForegroundColor Yellow

Restart-AzureRmVM -ResourceGroupName $rgName -Name $vmName -Verbose
Write-Host("MV Apagada") -ForegroundColor Yellow