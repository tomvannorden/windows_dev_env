Configuration install_win_packages

{
    Import-DscResource -Module cChoco
    Node "localhost"
    {
        cChocoPackageInstaller install_wsl
        {
            Name                 = 'wsl2'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller install_ubuntu2204
        {
            Name                 = 'wsl-ubuntu-2204'
            Ensure               = 'Present'
            AutoUpgrade          = $True
            DependsOn            = "[cChocoPackageInstaller]install_wsl"
        }
        cChocoPackageInstaller install_vscode
        {
            Name                 = 'vscode'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller install_pinginfoview
        {
            Name                 = 'pinginfoview'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller install_winscp
        {
            Name                 = 'winscp'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller install_windows_terminal
        {
            Name                 = 'microsoft-windows-terminal'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller install_mobaxterm
        {
            Name                 = 'mobaxterm'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller install_tightvnc
        {
            Name                 = 'tightvnc'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller install_tigervnc
		# older version to connect to thinclient
		{
            Name                 = 'tigervnc'
            Ensure               = 'Present'
            AutoUpgrade          = $False
        }
        cChocoPackageInstaller install_nmap
		{
            Name                 = 'nmap'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
    }
}

$config = install_win_packages

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force