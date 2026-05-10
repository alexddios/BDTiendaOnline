# BD Tienda Online (Sistema de Gestion Hospitalaria)

## Diagrama Entidad-Relación
<img width="942" height="482" alt="image" src="https://github.com/user-attachments/assets/0dfb9447-1f5d-451e-884b-ec8e81aded8f" />

## Que hace la aplicacion
Este proyecto implementa una base de datos relacional en MySQL para gestionar pacientes, medicos, citas, habitaciones e ingresos hospitalarios. Incluye scripts para crear la estructura (`DDL.sql`), cargar datos de ejemplo (`DML.sql`), ejecutar consultas frecuentes (`Consultas SQL.sql`) y automatizar una operación común mediante procedimiento almacenado (`Procedimiento.sql`).

## Decisiones de diseño
- **Claves primarias naturales y técnicas**:
  - `PACIENTE.dni` se usa como PK por ser identificador único real del paciente.
  - `MEDICO.num_colegiado` se usa como PK por representar el identificador profesional oficial.
  - `CITA.id` e `INGRESO.id` son PK `AUTO_INCREMENT` porque son eventos transaccionales repetibles y conviene un identificador técnico simple.
  - `HABITACION.numero` es PK natural porque identifica de forma directa cada habitación física.
- **Integridad referencial con claves foráneas**:
  - `CITA.dni_paciente -> PACIENTE.dni` y `CITA.id_medico -> MEDICO.num_colegiado` garantizan que no existan citas con datos huérfanos.
  - `INGRESO.id_paciente -> PACIENTE.dni` y `INGRESO.id_habitacion -> HABITACION.numero` garantizan ingresos válidos.
- **Normalización**:
  - El modelo separa entidades base (`PACIENTE`, `MEDICO`, `HABITACION`) de hechos/eventos (`CITA`, `INGRESO`) para evitar duplicidad de datos.
  - Los atributos dependen de su clave y no hay grupos repetitivos en una misma tabla (alineado con 3FN para este alcance académico).
  - Se controla consistencia adicional con `UNIQUE` en `PACIENTE.email` y `ENUM` en `CITA.estado`.

## Tecnologías usadas
- **MySQL** (dialecto SQL principal del proyecto)
- **SQL** (DDL, DML, consultas, procedimientos almacenados)
- **XML** (archivos de configuración del IDE en `.idea/`)
- **DataGrip / JetBrains IDE** (entorno de trabajo)

> Nota: actualmente no hay código Java 17 ni SQLite en este repositorio.

## Como ejecutarlo
### Requisitos
- MySQL Server 8.x (o compatible con `ENUM`, `AUTO_INCREMENT` y procedimientos)
- Cliente MySQL (`mysql`) o IDE SQL (por ejemplo, DataGrip)
- Usuario con permisos para crear esquema, tablas, vistas y procedimientos

### Pasos exactos
1. Abrir una terminal y conectarte a MySQL:
   ```bash
   mysql -u TU_USUARIO -p
   ```
2. Crear y seleccionar la base de datos:
   ```sql
   CREATE DATABASE IF NOT EXISTS TiendaOnline;
   USE TiendaOnline;
   ```
3. Ejecutar el script de estructura:
   ```sql
   SOURCE /ruta/al/proyecto/DDL.sql;
   ```
4. Cargar datos de ejemplo:
   ```sql
   SOURCE /ruta/al/proyecto/DML.sql;
   ```
5. Crear el procedimiento almacenado:
   ```sql
   SOURCE /ruta/al/proyecto/Procedimiento.sql;
   ```
6. Ejecutar consultas de prueba:
   ```sql
   SOURCE /ruta/al/proyecto/Consultas SQL.sql;
   ```

## Estructura de carpetas
```text
BD Tienda Online/
|-- DDL.sql
|-- DML.sql
|-- Consultas SQL.sql
|-- Procedimiento.sql
`-- .idea/
    |-- .gitignore
    |-- BD Tienda Online.iml
    |-- data_source_mapping.xml
    |-- db-forest-config.xml
    |-- modules.xml
    |-- sqldialects.xml
    |-- vcs.xml
    `-- workspace.xml
```

## Que aprendi
Diseñar bien las claves cambia por completo la facilidad para consultar y mantener los datos. También comprobé que separar entidades maestras de eventos (citas/ingresos) reduce errores y duplicidad desde el principio. Me quedo claro que la integridad referencial no es "decorativa": evita incoherencias reales cuando el proyecto crece. Por último, documentar la ejecución paso a paso ahorra mucho tiempo al volver al proyecto semanas después.
