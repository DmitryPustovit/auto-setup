$devices = powercfg -devicequery wake_armed

if ($devices -eq "NONE") {
    Write-Host "No devices found."
    exit
}

foreach ($device in $devices) {
    if ([string]::IsNullOrWhiteSpace($device)) {
        continue
    }

    $confirmMessage = "Disable ability to wake from sleep for device: [$device] (Y/N)"
    $response = Read-Host -Prompt $confirmMessage

    if ($response -eq "Y" -or $response -eq "y") {
        Write-Host "Disabling device: [$device]"
        powercfg -devicedisablewake $device
    }
}

Write-Host "Done."
