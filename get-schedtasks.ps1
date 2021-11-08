$tasks = Get-ChildItem "c:\windows\system32\tasks" -recurse
ForEach($task in $tasks){
write-host "'r 'n[+] Task: $task"
write-host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 'r 'n"
get-content $task -ErrorAction SilentlyContinue | select-string -Pattern '<command>' -SimpleMatch}