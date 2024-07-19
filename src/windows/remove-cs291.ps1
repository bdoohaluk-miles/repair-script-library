. .\src\windows\common\setup\init.ps1
. .\src\windows\common\helpers\Get-Disk-Partitions.ps1

$partitionlist = Get-Disk-Partitions

forEach ( $partition in $partitionlist )
{
    $driveLetter = ($partition.DriveLetter + ":")
    Get-Item $driveLetter +":\Windows\System32\drivers\CrowdStrike\C-00000291*.sys" | Remove-Item -Verbose
}
return $STATUS_SUCCESS
