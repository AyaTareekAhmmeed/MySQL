--Stored Procedure
--create the stored procedure
DELIMITER //

CREATE PROCEDURE RETRIEVE_ALL()

BEGIN
   SELECT *  FROM PETSALE;
END //
DELIMITER ;

--call the RETRIEVE_ALL routine proceder
CALL RETRIEVE_ALL;

--to drop the stored procedure routine RETRIEVE_ALL
DROP PROCEDURE RETRIEVE_ALL;

CALL RETRIEVE_ALL;


-- Stored Procedure: Exercise 2
--To create the stored procedure routine
DELIMITER @
CREATE PROCEDURE UPDATE_SALEPRICE (IN Animal_ID INTEGER, IN Animal_Health VARCHAR(5))
BEGIN
    IF Animal_Health = 'BAD' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.25)
        WHERE ID = Animal_ID;
    ELSEIF Animal_Health = 'WORSE' THEN
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE - (SALEPRICE * 0.5)
        WHERE ID = Animal_ID;
    ELSE
        UPDATE PETSALE
        SET SALEPRICE = SALEPRICE
        WHERE ID = Animal_ID;
    END IF;
END @

DELIMITER ;

--Let's call the UPDATE_SALEPRICE routine
   CALL RETRIEVE_ALL;

   CALL UPDATE_SALEPRICE(1, 'BAD');

   CALL RETRIEVE_ALL;
   
--Let's call the UPDATE_SALEPRICE routine once again
   CALL RETRIEVE_ALL;

   CALL UPDATE_SALEPRICE(3, 'WORSE');

   CALL RETRIEVE_ALL;
   
--If you wish to drop the stored procedure routine UPDATE_SALEPRICE
DROP PROCEDURE UPDATE_SALEPRICE;

CALL UPDATE_SALEPRICE;
