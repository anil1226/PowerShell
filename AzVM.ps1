param(
    [string]$resourceGroup
)
$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."

For ($i = 1; $i -le 3; $i++) 
{
    $vmName = "Demo" + $i
    Write-Host "Creating VM: " $vmName

    New-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Location 'East US' -Credential $adminCredential -OpenPorts 22 -Image Ubuntu2204 -PublicIpAddressName $($vmName+'-ip')

}


$vm1 = (Get-AzVM -ResourceGroupName azps1 -Name ubuntuazps1)

if([string]::IsNullOrEmpty($vm1))
{
    
}



$vm1.HardwareProfile

$vm1.StorageProfile.OsDisk

$vm1 | Get-AzVMSize | Format-Table

Get-AzPublicIpAddress -ResourceGroupName azps1 -Name azps1pip

Remove-AzVM -ResourceGroupName azps1 -Name ubuntuazps1

Remove-AzResourceGroup -Name azps1

