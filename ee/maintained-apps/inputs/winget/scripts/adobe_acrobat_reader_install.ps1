$exeFilePath = "${env:INSTALLER_PATH}"

try {

# Add argument to install silently
# Argument to make install silent depends on installer,
# each installer might use different argument (usually it's "/S" or "/s")
$processOptions = @{
  FilePath = "$exeFilePath"
  ArgumentList = "-sfx_nu /sAll /rs /msi"
  PassThru = $true
  Wait = $true
}
    
# Start process and track exit code
$process = Start-Process @processOptions
$exitCode = $process.ExitCode

# Prints the exit code
Write-Host "Install exit code: $exitCode"
Exit $exitCode

} catch {
  Write-Host "Error: $_"
  Exit 1
}
