Configuration install_psmodules

{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    $modules = @("cchoco", "nx", "xSmbShare")
    Node 'localhost'
    {
		foreach ($mod in $modules)
		{
			Script $mod
			{
				SetScript = { Install-Module -Name $using:mod -Force -Verbose}
				TestScript = { if (Get-Module -ListAvailable -Name $using:mod) {$true} }
				GetScript = {
				#Do Nothing 
				}
			}
		}
	}
}

$config = install_psmodules

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force