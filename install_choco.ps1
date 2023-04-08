Configuration install_choco

{
    Import-DscResource -Module cChoco
    Node "localhost"
    {
        cChocoInstaller install_chocolatey
        {
            InstallDir = "C:\ProgramData\chocolatey"
        }
    }
}

$config = install_choco

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force