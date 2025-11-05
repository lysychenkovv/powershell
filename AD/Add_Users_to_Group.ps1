$groupName = "put you AD group name here"
$userList = Get-Content -Path "C:\Users_list.txt"

foreach ($user in $userList) {
    if (Get-ADUser -Filter {SamAccountName -eq $user}) {
        Add-ADGroupMember -Identity $groupName -Members $user
        Write-Host "User $user added to $groupName."
    } else {
        Write-Host "User $user not found."
    }
}
