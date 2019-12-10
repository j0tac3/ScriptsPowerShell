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

# Limpiamos la pantalla para iniciar el programa
clear

$arrayMensajes=@{saludo="Hola, le ayudare durante la preparacion del entorno su entorno de trabajo.
Durante todo el proceso podra pedir informacion sobre el paso que se realizara tecleando 'help'.`n
Empecemos ...`n"}

$arrayExplicacion=@{ide="Un entorno de desarrollo integrado o entorno de desarrollo interactivo, en inglés Integrated Development Environment (IDE), es una aplicación informática que proporciona servicios integrales para facilitarle al desarrollador o programador el desarrollo de software.";
                    xampp="XAMPP es un paquete de software libre, que consiste principalmente en el sistema de gestión de bases de datos MySQL, el servidor web Apache y los intérpretes para lenguajes de script PHP y Perl. El nombre es en realidad un acrónimo: X (para cualquiera de los diferentes sistemas operativos), Apache, MariaDB/MySQL, PHP, Perl. A partir de la versión 5.6.15, XAMPP cambió la base de datos MySQL por MariaDB, un fork de MySQL con licencia GPL. ";
                    composer="Composer es un sistema de gestión de paquetes para programar en PHP el cual provee los formatos estándar necesarios para manejar dependencias y librerías de PHP. Fue desarrollado por Nils Adermann y Jordi Boggiano quienes continúan dirigiendo el proyecto. Ambos comenzaron el desarrollo en abril de 2011 y en marzo de 2012 presentaron la primera versión. Composer está inspirado en Node.js, npm y en Bundler Ruby.";
                    git="Git (pronunciado 'guit'​) es un software de control de versiones diseñado por Linus Torvalds, pensando en la eficiencia y la confiabilidad del mantenimiento de versiones de aplicaciones cuando éstas tienen un gran número de archivos de código fuente. Su propósito es llevar registro de los cambios en archivos de computadora y coordinar el trabajo que varias personas realizan sobre archivos compartidos.";
                    nodejs="Node.js es un entorno en tiempo de ejecución multiplataforma, de código abierto, para la capa del servidor (pero no limitándose a ello) basado en el lenguaje de programación ECMAScript, asíncrono, con I/O de datos en una arquitectura orientada a eventos y basado en el motor V8 de Google. Fue creado con el enfoque de ser útil en la creación de programas de red altamente escalables, como por ejemplo, servidores web. Fue creado por Ryan Dahl en 2009 y su evolución está apadrinada por la empresa Joyent, que además tiene contratado a Dahl en plantilla."}

$arrayExplicacionIDE=@{1="Visual Studio Code es un editor de código fuente desarrollado por Microsoft para Windows , Linux y macOS. Incluye soporte para la depuración, control integrado de Git, resaltado de sintaxis, finalización inteligente de código, fragmentos y refactorización de código. También es personalizable, por lo que los usuarios pueden cambiar el tema del editor, los atajos de teclado y las preferencias. Es gratuito y de código abierto, aunque la descarga oficial está bajo software propietario requiriendo tus datos de uso del programa legalmente.";2="Notepad++ es un editor de texto y de código fuente libre con soporte para varios lenguajes de programación. Con soporte nativo para Microsoft Windows.";3="Sublime Text es un editor de texto y editor de código fuente está escrito en C++ y Python para los plugins.1​ Desarrollado originalmente como una extensión de Vim, con el tiempo fue creando una identidad propia, por esto aún conserva un modo de edición tipo vi llamado Vintage mode."}

# Creamos un array asociativo en el cual introducimos los nombres de los intaladores
$arrayInstallers = @{1="Visual_Studio_Code_Installer.exe";2="Composer_Intaller.exe";3="Git_Installer.exe";4="Xampp_Installer.exe";5="Node_Installer.msi"}
do {
    # Mostramos un menu al usuario
    # Cada opcion corresponde a un valor en el array asociativo creado con anterioridad
    Write-Host "************************
    1- IDE
    2- Composer
    3- Git
    4- Xampp
    5- NodeJS
    9- Ayuda
    0- Salir
    ************************"
    # Preguntamos al usuario que opcion del menu desea realizar y la almacenamos
    [int]$opcion = Read-Host "¿Que deseas instalar?"
    # Comprobamos si la opcion es distinta (-ne) a cero
    if ($opcion -le 1) {
        do {
            Write-Output "Si desea informacion escriba la opcion seguido de la letra h: ejem. 1h"
            Write-Host "************************
        1- Visual Studio Code
        2- NotePad ++
        3- Sublime Text
        0- Salir
        ************************"
            [string]$opcionIDE = Read-Host "Cual de los tres IDE le gustaria instalar?"
            Write-Output $opcionIDE.Length
            $numero = $opcionIDE[0]
            if ($opcionIDE.Length -gt 1) {
                $arrayExplicacionIDE["$numero"]
            }
            
        }while($opcionIDE -ne 0)
    }
    elseIf ($opcion -ne 0 -and $opcion -ne 9) {
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