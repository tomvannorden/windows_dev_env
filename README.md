# windows_dev_env
Repository that contains my infra as code to manage my Windows development environment

# Initial setup
1. Make sure that at least powershell 5.1 is installed.
  - Open up a powershell cli and type "$PSVersionTable.PSVersion".
  - If the correct version is not installed upgrade powershell.

2. Make sure PSRemoting is enabled
  - Open up a powershell cli and type "Enter-PSSession -ComputerName localhost". A remote session to "localhost" should be opened ("[localhost]:" should show in the cli).
  - In case of any errors, open up a powershell cli and type "Enable-PSRemoting -SkipNetworkProfileCheck -Force" and try to open another remote session to localhost.

3. Check the installed DSC command modules
  - Open up a powershell cli and type "Get-Command -Module PSDesiredStateConfiguration
  - It should show the DSC commands available. If not present make sure the correct version of powershell is installed.

4. Make sure git is installed
  - Open up a powershell cli and type "git --version".
  - If the output does not show a version, download git for windows from its website.

5. Clone this repository in your local directory.

6. Open up a powershell cli and execute "initial_install.ps1". 

7. Open up a powershell cli and execute your first ps dsc configuration: "install_choco.ps1".

# Usage
