# Define a list of software to uninstall
$softwareToUninstall = @(
    "HP Wolf Security"
	"HP Wolf Security - Console"
    "HP Security Update Service"
    "HP Client Security Manager"
	"HP Connection Optimizer"
	"HP Documentation"
    "HP Notifications"
    "HP Security Update Service"
    "HP System Default Settings"
    "HP Wolf Security Application Support for Sure Sense"
    "HP Wolf Security Application Support for Windows"
	"Microsoft.OneDrive",
    "TCO Certified",
    "Microsoft.Office.OneNote",
    "HP Audio Control"
)
    # Add more HP bloatware entries here as needed
)

# Loop through the list and uninstall each software
foreach ($software in $softwareToUninstall) {
    Write-Host "Uninstalling $software..."
    
    # Try to uninstall the software
    try {
        # Use the "Get-WmiObject" cmdlet to query the software
        $uninstall = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*$software*" }
        
        if ($uninstall) {
            # Uninstall the software
            $uninstall.Uninstall()
            Write-Host "$software has been uninstalled."
        } else {
            Write-Host "$software not found. Skipping..."
        }
    } catch {
        Write-Host "Failed to uninstall"
    }
}
