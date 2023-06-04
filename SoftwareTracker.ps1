$SoftwareData = @{}

# Get the current active window title
function GetActiveWindowTitle {
    $WindowTitle = (Get-Process -WindowStyle Hidden | Where-Object { $_.MainWindowTitle.Length -gt 0 }).MainWindowTitle
    return $WindowTitle
}

# Track the usage of software
function TrackSoftwareUsage {
    $CurrentTime = Get-Date
    $CurrentHour = $CurrentTime.Hour
    $ActiveWindowTitle = GetActiveWindowTitle

    if ($ActiveWindowTitle) {
        if ($SoftwareData.ContainsKey($CurrentHour)) {
            if ($SoftwareData[$CurrentHour].ContainsKey($ActiveWindowTitle)) {
                $SoftwareData[$CurrentHour][$ActiveWindowTitle]++
            }
            else {
                $SoftwareData[$CurrentHour][$ActiveWindowTitle] = 1
            }
        }
        else {
            $SoftwareData[$CurrentHour] = @{
                $ActiveWindowTitle = 1
            }
        }
    }
}

# Main loop to continuously track software usage
while ($true) {
    TrackSoftwareUsage
    Start-Sleep -Seconds 5
}
