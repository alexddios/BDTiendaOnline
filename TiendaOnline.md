classDiagram
direction BT
class CITA {
   date fecha
   time hora
   varchar(200) motivo
   enum('pendiente', 'realizada', 'cancelada') estado
   varchar(9) dni_paciente
   varchar(10) id_medico
   int id
}
class HABITACION {
   int PLANTA
   varchar(255) TIPO
   tinyint(1) DISPONIBLE
   int NUMERO
}
class INGRESO {
   date FECHA_ENTRADA
   date FECHA_SALIDA
   varchar(255) DIAGNOSTICO
   varchar(9) ID_PACIENTE
   int ID_HABITACION
   int ID
}
class MEDICO {
   varchar(50) nombre
   varchar(50) especialidad
   varchar(15) telefono
   varchar(10) num_colegiado
}
class PACIENTE {
   varchar(50) nombre
   varchar(100) apellidos
   date fecha_nac
   varchar(15) telefono
   varchar(100) email
   varchar(9) dni
}
class agenda_hoy {
   varchar(50) paciente
   varchar(50) medico
   time hora
   varchar(200) motivo
}

CITA  -->  MEDICO : id_medico:num_colegiado
CITA  -->  PACIENTE : dni_paciente:dni
INGRESO  -->  HABITACION : ID_HABITACION:NUMERO
INGRESO  -->  PACIENTE : ID_PACIENTE:dni
