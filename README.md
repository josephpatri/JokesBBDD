# Base de Datos de Chistes

Este repositorio contiene un script SQL para la creación de una base de datos destinada a almacenar chistes, usuarios y temáticas relacionadas con los chistes. El script crea las tablas necesarias junto con sus relaciones y algunos índices para optimizar las consultas.

## Estructura de la Base de Datos

La base de datos creada se denomina "BaseDeChistes" y consta de las siguientes tablas:

### 1. Usuarios

Tabla para almacenar información sobre los usuarios del sistema.

```sql
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Contrasena NVARCHAR(50) NOT NULL
);
```
### 2. Temáticas

Tabla para almacenar las temáticas relacionadas con los chistes.

```sql
CREATE TABLE Tematicas (
    TematicaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL
);
```
### 3. Chistes

Tabla para almacenar los chistes, junto con su título, cuerpo y autor.

```sql
CREATE TABLE Chistes (
    ChisteID INT PRIMARY KEY IDENTITY(1,1),
    Titulo NVARCHAR(100) NOT NULL,
    Cuerpo NVARCHAR(MAX) NOT NULL,
    AutorID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID) ON DELETE CASCADE ON UPDATE CASCADE
);
```

### 4. ChistesTematicas

Tabla intermedia para la relación muchos a muchos entre chistes y temáticas.

```sql
CREATE TABLE ChistesTematicas (
    ChisteID INT,
    TematicaID INT,
    PRIMARY KEY (ChisteID, TematicaID),
    FOREIGN KEY (ChisteID) REFERENCES Chistes(ChisteID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TematicaID) REFERENCES Tematicas(TematicaID) ON DELETE CASCADE ON UPDATE CASCADE
);
```

## Instrucciones de Uso
- Ejecutar el script en un gestor de bases de datos compatible para crear la estructura de la base de datos.
- Utilizar las tablas y relaciones definidas para almacenar y consultar chistes, usuarios y temáticas.

## Notas
- Se recomienda revisar la estructura de la base de datos y modificarla según sea necesario para adaptarse a los requisitos específicos del proyecto.
