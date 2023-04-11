Configuration install_pack_providers

{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    $package_providers = @("NuGet")
    Node 'localhost'
    {
		foreach ($pack_prov in $package_providers)
		{
			Script $pack_prov
			{
				SetScript = { Install-PackageProvider -Name $using:pack_prov -Force -Verbose}
				TestScript = { if (Get-PackageProvider -Name $using:pack_prov) {$true} }
				GetScript = {
				#Do Nothing 
				}
			}
		}
	}
}

$config = install_pack_providers

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force