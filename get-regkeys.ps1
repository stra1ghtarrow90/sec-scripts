$sysKeys ="HKEY_LOCAL_MACHINE\Software\microsoft\windows\currentversion\run", "HKEY_LOCAL_MACHINE\Software\microsoft\windows\currentversion\runonce"
ForEach ($key in $sysKeys) {
Get-ItemProperty Registry::$Key
}
$users = (Get-WmiObject win32_UserProfile | Where-Object {$_.SID -notmatch 'S-1-5-(18|19|20).*'})
$userPaths =$users.localpath
$UserSIDS = $Users.sid

for ($counter=0; $counter -lt $users.length; $counter++){
$path =$users[$counter].localpath
$sid=$users[$counter].sid
reg load hku\$sid $path\ntuser.dat
}

Get-ItemProperty Registry::\hku\*\software\Microsoft\windows\currentversion\run;
Get-ItemProperty Registry::\hku\*\software\Microsoft\windows\currentversion\runonce;

ForEach ($key in $sysKeys){
Get-ItemProperty Registry::$key
}