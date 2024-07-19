# Initialize script
. .\src\windows\common\setup\init.ps1
. .\src\windows\common\helpers\Get-Disk-Partitions.ps1

	# Handle disk partitions
	$partitionlist = Get-Disk-Partitions
	$partitionGroup = $partitionlist | Group-Object DiskNumber
	$fixedDrives = $partitionGroup.Group | Select-Object -ExpandProperty DriveLetter

	# Collect drive letters except for root drive of Rescue VM
	$driveLetters += $fixedDrives

        ForEach ($drive in $driveLetters ) {
              Get-Item $drive + ":\Windows\System32\drivers\CrowdStrike\C-00000291*.sys" | Remove-Item -Verbose
        }
		
