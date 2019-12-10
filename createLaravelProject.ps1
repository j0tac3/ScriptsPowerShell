###############################################################################
# 
# Nombre del script: createLaravelProject.ps1
# Tpo: Powershell
# Proposito: Script para la crear un nuevo proyecto Laravel o bajarse uno nuevo desde un repositorio de GitHub
# Autor: J0tace
# Fecha de creacion: 30/11/2019
# Fecha de modificacion: 03/12/2019
# Version: 1.2.2
# Modificaciones Realizadas (03/12/2019):
# - Se ha añadido el menu de opciones
# - Se ha añadido la opcion de bajar un proyecto exitente de GitHub
# - Se ha añadido una cabecera al script
# - Se ha añadido un control de errores try/catch *pdt. de probar
#

# Limpiamos la pantalla para iniciar el programa
clear
try {
    # Preguntamos al usuario que accion desea realizar
    Write-Host "*********************************
    1- Crear un nuevo proyecto
    2- Bajar un proyecto existente
    0- Salir
    *********************************"
    $respuesta = Read-Host "¿Que le gustaria hacer?"
    switch ($respuesta) {
        1{
            # Solicitamos el nombre del proyecto que crearemos
            $nameProject = Read-Host "¿Cúal sera el nombre del proyecto?"
            # Mostramos un mensaje informativo al usuario con el nombre del proyecto que se creara
            Write-Output "El proyecto a crear se llamara $nameProject"
            # Ahora pediremos el nombre de las tablas al usuario
            $tables = Read-Host "Introduzca el nombre de las tablas del proyecto (tabla1,tabla2,tabla3 ...:"
            # Eliminamos los espacios en blanco que puedan haber insertado el usuario
            $tables = $tables.Replace(" ", "")
            # Creamos un array con los valores introducidos por el usuario
            $tablesToCreate = @($tables -split ",")
            # Creamos el proyecto con el comando de Laravel usando el nombre definido por el usuario
            composer create-project laravel/laravel $nameProject
            # Mensaje informativo al usuario indicando que se ha creado el proyecto
            Write-Output "Crear proyecto $nameProject ......... OK"
            # Cambiamos el directorio actual al del proyecto creado
            cd $nameProject
            # Ejecutamos el comando para prepara composer
            composer install
            Write-Output "Composer install in project ......... OK"
            # Empezaremos a crear las Migraciones
            Write-Output "Creando Modelos, Controladores, Semillas y Migraciones"
            # Creamos un bucle para recorrer el array
            for ($i = 0; $i -lt $tablesToCreate.Count; $i++) {
                # Pasamos el nombre de la tabla a minusculas
                $nameTableLower = $tablesToCreate[$i].ToString().ToLower()
                # Pasamos la primera letra del nombre a mayuscula
                $nameTableTitleCase = (Get-Culture).TextInfo.ToTitleCase($nameTableLower)
                # Crear Modelo
                php artisan make:model $nameTableTitleCase
                #Write-Output "Crear Modelo $nameTableTitleCase .......... OK"
                # Crear Controlador
                php artisan make:controller $nameTableTitleCase
                #Write-Output "Crear Controllador $nameTableTitleCase .......... OK"
                # Crear Migracion
                [string]$nameTableMigration = $nameTableLower+"s"
                #$nameTableMigration
                $createMigration="create_$nameTableMigration`_table" 
                php artisan make:migration $createMigration --create=$nameTableMigration
                #Write-Output "Crear Migracion $nameTableMigration .......... OK"
                # Crear Semilla
                php artisan make:seeder $nameTableTitleCase
                #Write-Output "Crear Semilla $nameTableTitleCase .......... OK"
            }
        }
        2{
            # Pedimos la url del repositorio
            $urlProyecto = Read-Host "Introduzca la url del proyecto de GitHub"
            # Realizamos el clone del proyecto
            git clone $urlProyecto
            # Cambiamos el directorio activo al del proyecto
            cd $urlProyecto
            # Realizamos el comando de composer para actualizar
            composer update
        }
    }
}
catch{
    Write-Warning "Se ha producido un error desconocido"
    $_.Exception.Message
}
Finally {
    Write-Output "- Fin de la ejecucion del script"
}