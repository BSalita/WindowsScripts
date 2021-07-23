$vm = "win-vm"
Remove-VMGpuPartitionAdapter -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm
$MinPartition=1
$MaxPartition=2
$OptimalPartition=1
Set-VMGpuPartitionAdapter -VMName $vm -MinPartitionVRAM $MinPartition
Set-VMGpuPartitionAdapter -VMName $vm -MaxPartitionVRAM $MaxPartition
Set-VMGpuPartitionAdapter -VMName $vm -MinPartitionCompute $MinPartition
Set-VMGpuPartitionAdapter -VMName $vm -MaxPartitionCompute $MaxPartition
Set-VMGpuPartitionAdapter -VMName $vm -OptimalPartitionVRAM $OptimalPartition
Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 1GB -VMName $vm
Set-VM -HighMemoryMappedIoSpace 8GB -VMName $vm
Start-VM -Name $vm