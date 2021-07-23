$vm='win-vm'
$gpup = Get-VMPartitionableGpu
Remove-VMGpuPartitionAdapter -VMName $vm
Set-VMPartitionableGpu -Name $gpup.Name -PartitionCount 1
Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 3072MB -VMName $vm
Set-VM -HighMemoryMappedIoSpace 32768MB -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm