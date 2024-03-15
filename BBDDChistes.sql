-- Crear la base de datos
CREATE DATABASE BaseDeChistes;

-- Cambiar al contexto de la nueva base de datos
USE BaseDeChistes;

-- Crear la tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Contrasena NVARCHAR(50) NOT NULL
);

-- Crear el índice en la columna Nombre de la tabla Usuarios
CREATE INDEX IX_Usuarios_Nombre ON Usuarios(Nombre);

-- Crear la tabla de Temáticas
CREATE TABLE Tematicas (
    TematicaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL
);

-- Crear el índice en la columna Nombre de la tabla Temáticas
CREATE INDEX IX_Tematicas_Nombre ON Tematicas(Nombre);

-- Crear la tabla de Chistes
CREATE TABLE Chistes (
    ChisteID INT PRIMARY KEY IDENTITY(1,1),
    Titulo NVARCHAR(100) NOT NULL,
    Cuerpo NVARCHAR(MAX) NOT NULL,
    AutorID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear el índice en la columna AutorID de la tabla Chistes
CREATE INDEX IX_Chistes_AutorID ON Chistes(AutorID);

-- Crear tabla intermedia para la relación muchos a muchos entre Chistes y Temáticas
CREATE TABLE ChistesTematicas (
    ChisteID INT,
    TematicaID INT,
    PRIMARY KEY (ChisteID, TematicaID),
    FOREIGN KEY (ChisteID) REFERENCES Chistes(ChisteID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TematicaID) REFERENCES Tematicas(TematicaID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear el índice en la columna ChisteID de la tabla ChistesTemáticas
CREATE INDEX IX_ChistesTematicas_ChisteID ON ChistesTematicas(ChisteID);

-- Crear el índice en la columna TematicaID de la tabla ChistesTemáticas
CREATE INDEX IX_ChistesTematicas_TematicaID ON ChistesTematicas(TematicaID);
