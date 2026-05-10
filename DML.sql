USE TiendaOnline;

-- 5 inserts PACIENTE
INSERT INTO PACIENTE (dni, nombre, apellidos, fecha_nac, telefono, email)
VALUES
    ('12345678A','Laura','García Pérez','1990-03-14','600111222','laura.garcia@example.com'),
    ('23456789B','Carlos','Ruiz Martín','1985-07-22','600222333','carlos.ruiz@example.com'),
    ('34567890C','Marta','López Sánchez','1998-11-05','600333444','marta.lopez@example.com'),
    ('45678901D','Javier','Navarro Díaz','1979-01-30','600444555','javier.navarro@example.com'),
    ('56789012E','Elena','Torres Gómez','2001-09-17','600555666','elena.torres@example.com');

-- 5 inserts MEDICO
INSERT INTO MEDICO (num_colegiado, nombre, especialidad, telefono)
VALUES
    ('COL1001','Ana Romero','Cardiología','611111111'),
    ('COL1002','Pedro Molina','Traumatología','622222222'),
    ('COL1003','Lucía Herrera','Pediatría','633333333'),
    ('COL1004','Sergio Castro','Dermatología','644444444'),
    ('COL1005','Nuria Vega','Neurología','655555555');

-- 5 inserts HABITACION
INSERT INTO HABITACION (NUMERO, PLANTA, TIPO, DISPONIBLE)
VALUES
    (101,1,'Individual',TRUE),
    (102,1,'Doble',FALSE),
    (201,2,'UCI',TRUE),
    (202,2,'Individual',TRUE),
    (301,3,'Doble',FALSE);

-- 5 inserts CITA
INSERT INTO CITA (fecha, hora, motivo, estado, dni_paciente, id_medico)
VALUES
    ('2026-05-12','09:00:00','Revisión anual','Pendiente','12345678A','COL1001'),
    ('2026-05-12','10:30:00','Dolor de rodilla','Realizada','23456789B','COL1002'),
    ('2026-05-13','11:15:00','Control pediátrico','Pendiente','34567890C','COL1003'),
    ('2026-05-14','16:00:00','Consulta por alergia','Cancelada','45678901D','COL1004'),
    ('2026-05-15','08:45:00','Migrañas frecuentes','Pendiente','56789012E','COL1005');

-- 5 inserts INGRESO
INSERT INTO INGRESO (FECHA_ENTRADA, FECHA_SALIDA, DIAGNOSTICO, ID_PACIENTE, ID_HABITACION)
VALUES
    ('2026-04-20','2026-04-25','Neumonía leve','12345678A',102),
    ('2026-04-28','2026-05-02','Fractura de tobillo','23456789B',301),
    ('2026-05-01','2026-05-03','Observación por fiebre alta','34567890C',101),
    ('2026-05-04',NULL,'Estudio neurológico','56789012E',201),
    ('2026-05-06','2026-05-09','Dermatitis severa','45678901D',202);