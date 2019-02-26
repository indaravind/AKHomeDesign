function GetInfo{
    param($ComputerName, $outputBox)
    write-host "Test"
    
    $outputBox.Text = Get-WmiObject -ComputerName $ComputerName -Class Win32_BIOS
    [System.Windows.Forms.Application]::DoEvents()
    $outputBox.Text += [System.Environment]::NewLine + "Waiting time 5 secs"
    [System.Windows.Forms.Application]::DoEvents()
    Start-Sleep -s 5
    $outputBox.Text += [System.Environment]::NewLine + "Waiting time - over"
    [System.Windows.Forms.Application]::DoEvents()
}
Export-ModuleMember -Function 'GetInfo'
