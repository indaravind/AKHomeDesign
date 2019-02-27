Import-Module .\GetInfoNew.psm1 -Force
[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    x:Name="desWindow">
    <Grid Name="Grid">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="Auto"/>
            <ColumnDefinition Width="Auto"/>
        </Grid.ColumnDefinitions>
        <TextBox x:Name = "PathTextBox"
            Width="150"
            Grid.Column="0"
            Grid.Row="0"
        />
        <Button Name="btnStatus" Grid.Column="0"
            Grid.Row="1">Update</Button>
    </Grid>
</Window>
"@
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)
$button = $window.FindName("btnStatus")

$txtBox = $window.FindName("PathTextBox")
$button.Add_Click(
    {    
	#[System.Windows.Forms.MessageBox]::Show("Hello World." , "My Dialog Box")
        GetInfoNew -ComputerName localhost
    }
)

$window.ShowDialog()
