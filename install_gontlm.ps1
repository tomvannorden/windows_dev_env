Configuration copy_go_path

{
    Node "localhost"
    {
        File copy_go_path
        {
            DestinationPath = "C:\Users\tvannor\Go"
			SourcePath = "C:\Program Files\Go"
			Type = "Directory"
			Recurse = $true
        }
    }
}

$config = copy_go_path

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force