#change varibales as needed for role name & account principal Role Name
$USER_NAME = 'doimain(local or AD)\USERNAME'
$Role_Name = 'AUTOMATION_RESTART'

#Root Folder (Usually Datacenter)
$rootFolder = Get-Folder -NoRecursion

#Add Permissions below to grant
#Read,view and VM On,Off,Reset
$vCenter_Privileges = @(
'System.Read',
'System.View',
'VirtualMachine.Interact.PowerOff',
'VirtualMachine.Interact.PowerOn',
'VirtualMachine.Interact.Reset')

New-VIRole -Name $Role_Name -Privilege (Get-VIPrivilege -ID $vCenter_Privileges) | Out-Null

New-VIPermission -Entity $rootFolder -Principal $USER_NAME -Role $Role_Name -Propagate:$true | Out-Null
