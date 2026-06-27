# Trabajo Práctico Integrador
## Materia: Bases de Datos 2 - UTN TUP

### Estudiantes
- Manfredi Aldo
- Alvarez Andrés

---

### Descripción
Ejercicio que continua el desarrollo de una base NoSQL con mongoDB de la Parte 1 del TPI con la Integración, Operaciones CRUD desde la aplicación y Backups.


#### Bloque 1: Operaciones CRUD desde la Aplicación
Se desarrollo una aplicacion utilizando Python que se conecta al clúster de MongoDB Atlas y ejecuta las diferentes operaciones CRUD.
Se ejecuta una insercion, lectura, modificacion y delete con baja logica de un documento. 

#### Bloque 2: Mecanismo de Backups y Resguardo
Se desarrollaron scripts

---

### Requisitos e instrucciones
- Python???
- Tener instalado **MongoDB Database Tools** (`mongodump`, `mongorestore`).
- Ejecutar los scripts de respaldo según el sistema operativo:
  - Linux/Mac: `linuxbackup.sh`
  - Windows: `winbackup.ps1`

---

### Estructura del proyecto
```plaintext
TPIBBDD2-MAIN/
 Parte 2/
 ├── linuxbackup.sh
 ├── winbackup.ps1
 ├── crudClientes.py
 ├── instalar_mongo.sh
 ├── README.md
 └── tpi2bbdd2.ipynb

