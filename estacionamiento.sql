CREATE DATABASE estacionamiento_db;

DROP TABLE IF EXISTS vehiculo;

CREATE TABLE vehiculo (
    id SERIAL PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    propietario VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    hora_ingreso VARCHAR(10) NOT NULL,
    horas_utilizadas NUMERIC(5, 2) NOT NULL CONSTRAINT chk_horas_positivas CHECK (horas_utilizadas > 0),
    costo NUMERIC(8, 2) NOT NULL CONSTRAINT chk_costo_no_negativo CHECK (costo >= 0),
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO vehiculo (placa, propietario, tipo, hora_ingreso, horas_utilizadas, costo)
VALUES 
    ('P123ABC', 'Carlos López', 'Automóvil', '08:00', 3.50, 35.00),
    ('M987XYZ', 'Ana Gómez', 'Motocicleta', '09:15', 2.00, 10.00),
    ('P456DEF', 'Mario Estrada', 'Automóvil', '10:30', 5.00, 50.00),
    ('M654UVW', 'Sofia Ruiz', 'Motocicleta', '11:00', 1.50, 7.50),
    ('P789GHI', 'Luis Hernández', 'Automóvil', '12:00', 4.00, 40.00);

	--consulta general
	SELECT id, placa, propietario, tipo, hora_ingreso, horas_utilizadas, costo, activo
FROM vehiculo;

--consulta filtrada por tipo de vehiculo
SELECT id, placa, propietario, tipo, costo
FROM vehiculo
WHERE tipo = 'Automóvil';

--consulta de vehiculos cuyo costo sea superior a un valor determinado
SELECT id, placa, propietario, tipo, costo
FROM vehiculo
WHERE costo > 20.00;

--consulta ordenada por costo de mayor a menor
SELECT id, placa, propietario, tipo, horas_utilizadas, costo
FROM vehiculo
ORDER BY costo DESC;

--Mantenimiento UPDATE/DELETE
--actualizacion de un registro mediante UPDATE propietario y horas
UPDATE vehiculo
SET propietario = 'Carlos López Alvarado', horas_utilizadas = 4.00, costo = 40.00
WHERE placa = 'P123ABC';

--cambio de estado de un vehiculo/desactivar el registro
UPDATE vehiculo
SET activo = FALSE
WHERE placa = 'M987XYZ';

--eliminacion de un registro mediante DELETE
DELETE FROM vehiculo
WHERE placa = 'M654UVW';

--comprobacion final tras updates y delete
SELECT id, placa, propietario, tipo, costo, activo FROM vehiculo;

--PRUEBAS DE ERROR
--placa duplicada
INSERT INTO vehiculo (placa, propietario, tipo, hora_ingreso, horas_utilizadas, costo)
VALUES ('P123ABC', 'Pedro Picapiedra', 'Automóvil', '14:00', 2.00, 20.00);

--PRUEBA ERROR 2 valor invalido
INSERT INTO vehiculo (placa, propietario, tipo, hora_ingreso, horas_utilizadas, costo)
VALUES ('P999ZZZ', 'Juan Pérez', 'Automóvil', '15:00', 0.00, 0.00);