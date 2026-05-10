DELIMITER $$
CREATE PROCEDURE cancelar_cita(IN p_id INT)
BEGIN
    UPDATE CITA SET estado = 'Cancelada' WHERE id = p_id;
    SELECT CONCAT('Cita ', p_id, ' cancelada correctamente') AS mensaje;
END $$
DELIMITER ;

-- Llamar al procedimiento:
CALL cancelar_cita(3);

