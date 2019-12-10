###############################################################################
# 
# Nombre del script: downloadFiles.ps1
# Tpo: Powershell
# Proposito: Bajarse los instaladores de los programas necesarios para prepara el entorno de trabajo
# Autor: J0tace
# Fecha de creacion: 01/12/2019
# Fecha de modificacion: 03/12/2019
# Version: 1.0.2
# Modificaciones Realizadas (03/12/2019):
# - Se ha añadido una cabecera al script
#

# Limpiamos la pantalla para iniciar el programa
clear
# Definimos el nombre de los archivos
[string]$visualFileOut = "Visual_Studio_Code_Installer.exe"
[string]$notepadPlusFileOut = "NotePadPlus.exe"
[string]$sublimeFileOut = "SublimeText.exe"
[string]$composerFileOut = "Composer_Intaller.exe"
[string]$gitFileOut = "Git_Installer.exe"
[string]$xamppFileOut = "Xampp_Installer.exe"
[string]$nodeFileOut = "Node_Installer.msi"

# Definimos la url de cada archivo que descargaremos
[string]$visualCodeURL = "https://aka.ms/win32-x64-user-stable"
[string]$notepadPlusURL = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.8.2/npp.7.8.2.Installer.x64.exe"
[string]$sublimeURL = "https://download.sublimetext.com/Sublime Text Build 3211 x64 Setup.exe"
[string]$composerURL = "https://getcomposer.org/Composer-Setup.exe"
[string]$gitURL = "https://github.com/git-for-windows/git/releases/download/v2.24.0.windows.2/Git-2.24.0.2-64-bit.exe"
[string]$xampURL = "https://www.apachefriends.org/xampp-files/7.3.11/xampp-windows-x64-7.3.11-0-VC15-installer.exe"
[string]$nodeURL = "https://nodejs.org/dist/v12.13.1/node-v12.13.1-x64.msi"

# Creamos un array con todos los nombres
$arrayURL = @($visualCodeURL,$notepadPlusURL,$sublimeURL,$composerURL,$gitURL,$xampURL,$nodeURL)
# Creamos un array con todas las urls
$arrayName = @($visualFileOut,$notepadPlusFileOut,$sublimeFileOut,$composerFileOut,$gitFileOut,$xamppFileOut,$nodeFileOut)
# Definios el path donde almacenaremos los instaladores descargados
[string]$pathDownload = "D:\Software"
# Creamos un directorio donde almacenaremos los archivos que descargaremos
New-Item -ItemType Directory -Force -Path $pathDownload
# Modificamos el directorio actual al de destino donde descargaremos los archivos
cd $pathDownload

# Recorremos los arrays y bajamos el instalador correspondiente a cada elemento del array
for ($i=0; $i -lt $arrayURL.Count; $i++){
    # Elegimos la url numero "i" del array
    [string]$url = $arrayURL[$i]
    # Elegimos el nombre "i" del array
    [string]$output = $arrayName[$i]
    # Creamos una fecha
    $start_time = Get-Date
    # Mostramos un mensaje informativo al usuario indicando que empezamos la descarga
    Write-Host "Bajando " $output
    # Empezamos la descarga con el metodo Invoke-WebRequest
    Invoke-WebRequest -Uri $url -OutFile $output
    # Mostramos el tiempo que ha tardado en realizar la tarea
    Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
}
# Mostramos la ruta final donde se encuentran los instaladores descargados
Write-Host "Todos los instaladores se han descargado en la siguiente ruta: " $pathDownload
