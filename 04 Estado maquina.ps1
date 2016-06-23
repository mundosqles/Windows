#
# Estado de maquinas
# http://www.mundosql.es/
#
 clear

Get-AzureRmVM -ResourceGroupName $rgName | get-azurermvm -Status | ?{$_.statuses.displaystatus -eq "VM running"} | select name,ResourceGroupName
Get-AzureRmVM -ResourceGroupName $rgName | get-azurermvm -Status | ?{$_.statuses.displaystatus -eq "VM deallocated"} | select name
