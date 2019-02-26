Import-Module .\GetInfo.psm1 -Force

Add-Type -AssemblyName System.Windows.Forms
$Form = New-Object system.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(350,300)
$Form.Text = "Update Progress Form" 

$outputBox = New-Object System.Windows.Forms.TextBox
#$outputBox.Location = New-Object System.Drawing.Size(10,10)
$outputBox.Size = New-Object System.Drawing.Size(300,200)
$outputBox.BackColor = "Blue"
$outputBox.ForeColor = "White"
$outputBox.MultiLine = $true
$outputBox.ScrollBars = "Vertical"
$outputBox.Font = "lucida console"
$outputBox.Text = Get-Process `
                    | Where-Object {$_.ProcessName -eq 'svchost' } `
                    | Format-Table -Property ID, ProcessName, Handles -AutoSize `
                    | Out-String
# Add Button
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(20,210)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Get Progress"

$Form.Controls.Add($Button)

#Add Button event 
$Button.Add_Click(
    {    
	#[System.Windows.Forms.MessageBox]::Show("Hello World." , "My Dialog Box")
        GetInfo -ComputerName localhost -outputBox $outputBox
    }
)
$Form.Controls.Add($outputBox)
$Form.ShowDialog()




