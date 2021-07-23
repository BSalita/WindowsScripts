$vm = "ENTER YOUR VM NAME HERE"

# Dlls that need to be copied
$GpuDllPaths = (Get-CimInstance Win32_VideoController).InstalledDisplayDrivers.split(',') | Get-Unique

# Extract directories
$GpuInfDirs = $GpuDllPaths | ForEach-Object {[System.IO.Path]::GetDirectoryName($_)} | Get-Unique

# Hack, leaving only NVidia drivers (solving issue with notebooks with multiple GPUs)
$GpuInfDirs = $GpuInfDirs | Where-Object {(Split-Path $_ -Leaf ).StartsWith("nv")}

# Start session to copy on quest machine
$s = New-PSSession -VMName $vm -Credential (Get-Credential)

# Copy (folders for file from $GpuDllPaths) nv_dispi.inf_amd64 folder from host to quest system
$GpuInfDirs | ForEach-Object { Copy-Item -ToSession $s -Path $_ -Destination C:\Windows\System32\HostDriverStore\FileRepository\ -Recurse -Force }

# Copy nvapi64.dll into quest system
Copy-Item -ToSession $s -Path C:\Windows\System32\nvapi64.dll -Destination C:\Windows\System32\

# Cleaning up session
Remove-PSSession $s

# Restarting the VM
Restart-VM $vm -Force