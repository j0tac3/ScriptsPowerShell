clear 
Get-WmiObject -Class Win32_Product | Select-Object -Property Name > D:\listadoProgramas.txt

Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table –AutoSize > D:\InstalledSoftwareList.txt

Get-ItemProperty HKLM:SoftwareWow6432NodeMicrosoftWindowsCurrentVersionUninstall* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table –AutoSize
# Comando que permite listar los progamas instalados en el ordenador
#Get-Package -Provider Programs -IncludeWindowsInstaller | Format-Table -AutoSize
#Get-Package -Provider Programs -IncludeWindowsInstaller -Name "Git*"
#$MyApp=Get-Package -Provider Programs -IncludeWindowsInstaller -Name "*xampp*"
#Write-Output $MyApp.Name
# Comando que permite desinstalar un programa
#Write-Output $MyApp.Version

[System.Collections.ArrayList]$applications=@("Xampp","Visual Studio Code","Composer","Node","Git","Laravel")
[System.Collections.ArrayList]$applicationsToInstall=@("Xampp","Visual Studio Code","Composer","Node","Git","Laravel")
foreach ($app in $applications) {
    $myApp=Get-Package -Provider Programs -IncludeWindowsInstaller -Name "*$app*"
    Write-Host "Application: "$myApp.Name
    if ($MyApp -ne "") {
        $applicationsToInstall.Remove($app)
    }
}
Write-Output "---------------------"
Write-Output "Programas a instalar"
if ($applicationsToInstall.Count -le 0) {
    Write-Host "Ya tienes instalados todos los programas necesarios. Felicidades!"
}
else {
    Write-Output $applicationsToInstall
}