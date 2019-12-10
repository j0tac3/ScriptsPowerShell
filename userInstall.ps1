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
# - Se ha añadido un bucle para las opciones del menu
#

# Creamos un array asociativo en el cual introducimos los nombres de los intaladores
$arrayInstallers = @{1="Visual_Studio_Code_Installer.exe";2="Composer_Intaller.exe";3="Git_Installer.exe";4="Xampp_Installer.exe";5="Node_Installer.msi"}
do {
    # Limpiamos la pantalla para iniciar el programa
    clear
    # Mostramos un menu al usuario
    # Cada opcion corresponde a un valor en el array asociativo creado con anterioridad
    Write-Host "************************
    1- Visual Studio Code
    2- Composer
    3- Git
    4- Xampp
    5- NodeJS
    0- Salir
    ************************"
    # Preguntamos al usuario que opcion del menu desea realizar y la almacenamos
    [int]$opcion = Read-Host "¿Que deseas instalar?"
    # Comprobamos si la opcion es distinta (-ne) a cero
    if ($opcion -ne 0) {
        # Modificamos el directorio actual al de la ubicacion de los instaladores
        cd D:\Software 
        # Iniciamos el instalador usando el array asociativo
        Invoke-Item $arrayInstallers.$opcion
    }
    else {
    # Finalizamos el script
        Write-Host "Hasta luego"
    }
}while($opcion -ne 0)