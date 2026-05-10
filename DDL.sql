DROP TABLE IF EXISTS INGRESO;
DROP TABLE IF EXISTS CITA;
DROP TABLE IF EXISTS PACIENTE;
DROP TABLE IF EXISTS MEDICO;
DROP TABLE IF EXISTS HABITACION;

CREATE TABLE PACIENTE (
                          dni         VARCHAR(9)   PRIMARY KEY,
                          nombre      VARCHAR(50)  NOT NULL,
                          apellidos   VARCHAR(100) NOT NULL,
                          fecha_nac   DATE,
                          telefono    VARCHAR(15),
                          email       VARCHAR(100) UNIQUE
);

CREATE TABLE MEDICO (
                        num_colegiado VARCHAR(10) PRIMARY KEY,
                        nombre        VARCHAR(50) NOT NULL,
                        especialidad  VARCHAR(50),
                        telefono      VARCHAR(15)
);

CREATE TABLE CITA (
                      id          INT AUTO_INCREMENT PRIMARY KEY,
                      fecha       DATE NOT NULL,
                      hora        TIME NOT NULL,
                      motivo      VARCHAR(200),
                      estado      ENUM('Pendiente','Realizada','Cancelada') DEFAULT 'Pendiente',
                      dni_paciente VARCHAR(9) NOT NULL,
                      id_medico   VARCHAR(10) NOT NULL,
                      FOREIGN KEY (dni_paciente) REFERENCES PACIENTE(dni),
                      FOREIGN KEY (id_medico)   REFERENCES MEDICO(num_colegiado)
);

CREATE TABLE HABITACION(
  NUMERO INT,
  PLANTA INT,
  TIPO VARCHAR(255),
  DISPONIBLE BOOLEAN,
  PRIMARY KEY (NUMERO,PLANTA)

);

CREATE TABLE INGRESO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FECHA_ENTRADA DATE,
    FECHA_SALIDA DATE,
    DIAGNOSTICO VARCHAR(255),
    ID_PACIENTE INT,
    ID_HABITACION INT,
    FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(dni),
    FOREIGN KEY (ID_HABITACION) REFERENCES HABITACION(NUMERO)
);