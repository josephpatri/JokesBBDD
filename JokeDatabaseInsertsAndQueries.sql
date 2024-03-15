-- Crear usuarios
INSERT INTO Usuarios (Nombre, Contrasena) VALUES ('Manolito', 'Contrasena');
INSERT INTO Usuarios (Nombre, Contrasena) VALUES ('Pepe', 'Contrasena');
INSERT INTO Usuarios (Nombre, Contrasena) VALUES ('Isabel', 'Contrasena');
INSERT INTO Usuarios (Nombre, Contrasena) VALUES ('Pedro', 'Contrasena');

-- Crear Temáticas
INSERT INTO Tematicas (Nombre) VALUES ('humor negro');
INSERT INTO Tematicas (Nombre) VALUES ('humor amarillo');
INSERT INTO Tematicas (Nombre) VALUES ('chistes verdes');

-- Crear chistes
-- Chistes de Manolito

/*  La función SCOPE_IDENTITY() devuelve el último valor de identidad insertado en la misma sesión y en el mismo alcance.
    Aquí se utiliza para obtener el ID del chiste insertado anteriormente y asociarlo con las temáticas.
    Esto asegura que las temáticas se relacionen correctamente con los chistes. */

INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 1 de Manolito', 'Cuerpo del chiste 1 de Manolito', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Manolito'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'humor negro'));
INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 2 de Manolito', 'Cuerpo del chiste 2 de Manolito', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Manolito'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'humor negro'));
INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 3 de Manolito', 'Cuerpo del chiste 3 de Manolito', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Manolito'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'humor negro'));

-- Chistes de Pepe
INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 1 de Pepe', 'Cuerpo del chiste 1 de Pepe', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Pepe'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'humor amarillo'));
INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 2 de Pepe', 'Cuerpo del chiste 2 de Pepe', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Pepe'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'humor amarillo'));
INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 3 de Pepe', 'Cuerpo del chiste 3 de Pepe', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Pepe'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'humor amarillo'));

-- Chistes de Isabel
INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 1 de Isabel', 'Cuerpo del chiste 1 de Isabel', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Isabel'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'chistes verdes'));
INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 2 de Isabel', 'Cuerpo del chiste 2 de Isabel', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Isabel'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'chistes verdes'));
INSERT INTO Chistes (Titulo, Cuerpo, AutorID) VALUES ('Chiste 3 de Isabel', 'Cuerpo del chiste 3 de Isabel', (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Isabel'));
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES (SCOPE_IDENTITY(), (SELECT TematicaID FROM Tematicas WHERE Nombre = 'chistes verdes'));

-- Consulta 1: Saca todos los chistes creados por el usuario "Manolito"
SELECT * FROM Chistes WHERE AutorID = (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Manolito');

-- Consulta 2: Saca todos los chistes de la temática "Humor negro"
SELECT c.* FROM Chistes c
INNER JOIN ChistesTematicas ct ON c.ChisteID = ct.ChisteID
INNER JOIN Tematicas t ON ct.TematicaID = t.TematicaID
WHERE t.Nombre = 'humor negro';

-- Consulta 3: Saca todos los chistes de la temática "Humor negro" creados por el usuario "Manolito"
SELECT c.* FROM Chistes c
INNER JOIN ChistesTematicas ct ON c.ChisteID = ct.ChisteID
INNER JOIN Tematicas t ON ct.TematicaID = t.TematicaID
WHERE t.Nombre = 'humor negro'
AND c.AutorID = (SELECT UsuarioID FROM Usuarios WHERE Nombre = 'Manolito');