$vm = "win-vm"
Remove-VMGpuPartitionAdapter -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm
$MinPartition=1
$MaxPartition=6
$OptimalPartition=5
Set-VMGpuPartitionAdapter -VMName $vm -MinPartitionVRAM $MinPartition
Set-VMGpuPartitionAdapter -VMName $vm -MaxPartitionVRAM $MaxPartition
Set-VMGpuPartitionAdapter -VMName $vm -OptimalPartitionVRAM $OptimalPartition
Set-VMGpuPartitionAdapter -VMName $vm -MinPartitionEncode $MinPartition
Set-VMGpuPartitionAdapter -VMName $vm -MaxPartitionEncode $MaxPartition
Set-VMGpuPartitionAdapter -VMName $vm -OptimalPartitionEncode $OptimalPartition
Set-VMGpuPartitionAdapter -VMName $vm -MinPartitionDecode $MinPartition
Set-VMGpuPartitionAdapter -VMName $vm -MaxPartitionDecode $MaxPartition
Set-VMGpuPartitionAdapter -VMName $vm -OptimalPartitionDecode $OptimalPartition
Set-VMGpuPartitionAdapter -VMName $vm -MinPartitionCompute $MinPartition
Set-VMGpuPartitionAdapter -VMName $vm -MaxPartitionCompute $MaxPartition
Set-VMGpuPartitionAdapter -VMName $vm -OptimalPartitionCompute $OptimalPartition
Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 1GB -VMName $vm
Set-VM -HighMemoryMappedIoSpace 8GB -VMName $vm
Start-VM -Name $vm