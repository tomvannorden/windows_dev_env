## Add package provider
Install-PackageProvider -Name NuGet -Force -Verbose

## Add powershell modules
Install-Module cChoco -Force -Verbose
Install-Module -Name nx -Force -Verbose