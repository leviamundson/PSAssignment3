<#

Purpose: 3rd Powershell Lab. Practices use of:
            Here-Strings
            Piping commands
            Writing and Reading files
            Conditional logic

Author:     Levi Amundson
File:       Lab3Spring2020.ps1
Date:`      February 24, 2020

#>

clear screen

set-location $env:USERPROFILE 
Get-ChildItem -Path  C:\users\amulevj\ -Filter *.txt | Format-Table Length,Name



$message = @'

What do you want to do?
    1. Write a contact entry to a file
    2. Display all files last written to after a given date
    3. Read a specified text file
    
'@ 
$message
$answer = Read-Host "Type a 1,2, or 3."

if ($answer -eq "1") {
    Write-Output "You have chose 1: You want to write a contact entry to the file"
    $name = Read-host -Prompt "Please enter your full name"
    $phonenumber = Read-host -Prompt "Please enter your phone number"
    $email = Read-host -Prompt "Please enter your email address"
    $filename = Read-host -Prompt "Enter your desired file name"

    Add-Content -Path C:\Users\amulevj\$filename -Value $name 
    Add-Content -Path C:\Users\amulevj\$filename -Value $phonenumber
    Add-Content -Path C:\Users\amulevj\$filename -Value $email 
    Add-content -Path C:\Users\amulevj\$filename -Value " "



}

elseif($answer -eq "2"){
    Write-Output "You have chose 2: You want to display all files last written to after a given date."
    $earliestdate = Read-host  "What is the earliest date?" 
    $lastwritedate = Get-ChildItem -Path "C:\Users\amulevj" | Where-Object {$_.LastWriteTime -ge $earliestdate} | Select-Object Name, LastWriteTime | Format-Table Name, LastWriteTime
    Write-Output " Earliest date of files to display:" $earliestdate $lastwritedate
}
elseif($answer -eq "3"){
    Set-Location $env:USERPROFILE
    write-output "You have chose 3: You want to read a specified text file." 
    $read = Read-host "What file do you want to read?" 
    $test = Test-path -path $read



    if ($test -eq $true){
        Get-Content -path $read
    }
    elseif ($test -eq $false){
        Write-output "That file was not available" 
    }
}


elseif ($answer )  {
    Write-Output "That is an invalid option."
    write-output $env:COMPUTERNAME 
    Write-Output $env:USERPROFILE
}





