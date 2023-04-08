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
            Name                 = 'choco install wsl-ubuntu-2204'
            Ensure               = 'Present'
            AutoUpgrade          = $True
            DependsOn            = "[cChocoPackageInstaller]install_wsl"
        }
    }
}

$config = install_win_packages

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force