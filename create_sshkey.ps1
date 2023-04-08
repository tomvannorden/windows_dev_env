Configuration ssh_dir

{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    $directory = "C:\Users\$env:UserName\.ssh"
    Node 'localhost'
    {
        Script ssh_dir
        {
            SetScript = { New-Item -Path $using:directory -ItemType Directory }
            TestScript = { Test-Path $using:directory }
            GetScript = {
              #Do Nothing 
            }
        }
    }
}

$config = ssh_dir

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force

#################################################################################

$file = "C:\Users\$env:UserName\.ssh\id_rsa_$env:UserName"

#If the file does not exist, create it.
if (-not(Test-Path -Path $file -PathType Leaf)) {
     try {
         ssh-keygen -t rsa -f $file -P """"
         Write-Host "A new ssh key is created"
     }
     catch {
         throw $_.Exception.Message
     }
 }
# If the file already exists, show the message and do nothing.
 else {
     Write-Host "Cannot create ssh key because a key with that name already exists."
 }

#ssh-keygen -t rsa -f "C:\Users\$env:UserName\.ssh\id_rsa_$env:UserName" -P """"