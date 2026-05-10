-- Pacientes con citas pendientes (JOIN)
SELECT p.nombre, p.apellidos, c.fecha, c.hora, m.nombre AS medico
FROM PACIENTE p
         JOIN CITA c ON p.dni = c.dni_paciente
         JOIN MEDICO m ON c.id_medico = m.num_colegiado
WHERE c.estado = 'Pendiente'
ORDER BY c.fecha, c.hora;

-- Número de citas por médico (GROUP BY)
SELECT m.nombre, m.especialidad, COUNT(c.id) AS total_citas
FROM MEDICO m
         LEFT JOIN CITA c ON m.num_colegiado = c.id_medico
GROUP BY m.num_colegiado, m.nombre, m.especialidad
ORDER BY total_citas DESC;

-- Pacientes sin ninguna cita (subconsulta)
SELECT nombre, apellidos
FROM PACIENTE
WHERE dni NOT IN (SELECT DISTINCT dni_paciente FROM CITA);

-- Vista: agenda del día de hoy
CREATE VIEW agenda_hoy AS
SELECT p.nombre AS paciente, m.nombre AS medico, c.hora, c.motivo
FROM CITA c
         JOIN PACIENTE p ON c.dni_paciente = p.dni
         JOIN MEDICO m ON c.id_medico = m.num_colegiado
WHERE c.fecha = CURDATE()
ORDER BY c.hora;

