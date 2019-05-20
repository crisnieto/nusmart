

SELECT * FROM Bitacora

SELECT * FROM Usuario

SELECT A.usuarioID, A.username, b.actividad, DATETIME(b.fecha), b.mensaje, b.tipoCriticidad, b.bitacoraID
FROM Usuario a JOIN Bitacora b ON (a.usuarioID = b.usuarioID)
WHERE tipoCriticidad = "baja"

exec sp_columns bitacora

SELECT DISTINCT b.usuarioID, a.usernameFROM Usuario a JOIN Bitacora b ON (a.usuarioID = b.usuarioID)

SELECT DISTINCT b.usuarioID, A.username
FROM Usuario a JOIN Bitacora b ON (a.usuarioID = b.usuarioID)	


SELECT DISTINCT usuarioID from Bitacora