# Trabajo Práctico Integrador
## Materia: Bases de Datos 2 - UTN TUP

### Estudiantes
- Manfredi Aldo
- Alvarez Andrés

---

### Descripción
Ejercicio que continua el desarrollo de una base NoSQL con mongoDB de la Parte 1 del TPI con la integración de pperaciones CRUD desde una aplicación externa y backups locales de la base de datos en un cluster Atlas.


#### Bloque 1: Operaciones CRUD desde la Aplicación
Se desarrollo una aplicacion utilizando Python??? que se conecta al clúster de MongoDB Atlas y ejecuta las diferentes operaciones CRUD.
Se ejecuta una insercion, lectura, modificacion y delete con baja logica de un documento para probar la conexion entre una aplicación y la base de datos remota. 

#### Bloque 2: Mecanismo de Backups y Resguardo
Se desarrollaron scripts para linux y windows que permiten descargar (mongodump) un respaldo de la base de datos del proyecto conectando a un clúster de Atlas. La articularidad es que al configurarse con rutas relativas, los respaldos se descargaran en la carpeta donde se ejecuta el script y separado en carpetas que tienen como nombre la fecha y hora del respaldo.

---

### Requisitos e instrucciones

#### Para operaciones CRUD desde la Aplicación

- Tener instalado Python???
- Correr la aplicacion por su nombre desde la terminal del IDE utilizado.

#### Para mecanismo de Backups y Resguardo

- Tener instalado **MongoDB Database Tools** (`mongodump`, `mongorestore`).
- Ejecutar los scripts de respaldo según el sistema operativo:
  - Linux/Mac: `linuxbackup.sh`
  - Windows: `winbackup.ps1`

---

### Estructura del proyecto (COMPLETAR)
```plaintext
TPIBBDD2-MAIN/
 Parte 2/
 ├── linuxbackup.sh
 ├── winbackup.ps1
 ├── crudClientes.py
 ├── instalar_mongo.sh
 ├── README.md
 └── tpi2bbdd2.ipynb

