Configuration copy_go_path

{
    Node "localhost"
    {
        Environment copy_go_path
        {
            Name = "go"
			Value = "C:\Program Files\Go\bin\"
			Path = $true
			Ensure = "Present"
        }
    }
}

$config = copy_go_path

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force