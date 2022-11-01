#Clase 7 
Delimiter $$

create procedure usp_procedure1 (inout pi_valor1 int, inout pi_valor2 int )  
begin
  declare valor1 INT default 0;
  declare valor2 INT;  
  set valor2=0;
  
  #while valor1=valor2 do
  #  set valor1=rand()*10;
  #  set valor2=rand()*10;
  #end while;
  
  repeat
    set valor1=rand()*10;
    set valor2=rand()*10;
  until valor1<>valor2  
  
  etiqueta1:loop
    set valor1=rand()*10;
    set valor2=rand()*10;
    if valor1<>valor2 then
      leave etiqueta1;
    end if;
  end loop;
  
  
  set pi_valor1 = valor1;
  set pi_valor2 = valor2;
  
  call usp_procedure2(pi_valor1, pi_valor2,@status , @error_message ,  @codigo )
  if @status = 0 then select 'OK'
  else select @error_message
  
end ; $$

set @v1 = 5;
call usp_procedure1(@v1,@v2)

select @v1, @v2











begin 
  repeat
    set valor1=rand()*10;
    set valor2=rand()*10;
  until valor1<>valor2  
end repeat;

begin 
etiqueta1:loop
    set valor1=rand()*10;
    set valor2=rand()*10;
    if valor1<>valor2 then
      leave etiqueta1;
    end if;
  end loop;
End; 




#Crear procedimiento que itere entre un rango de valores, p1 < p2 y por cada valor me diga si es par o no par
#TODO: Hacer el cambio en p1 para que ejecute el procedimiento con los resultados de las 3 repetitivas

DELIMITER $$ 
CREATE PROCEDURE usp_par_impar(p1 int, p2 int)
BEGIN
DECLARE counter INT DEFAULT 0;

#While
SELECT 'While'; 
WHILE p1 <= p2 do 
	
	SELECT CASE 
		WHEN p1 % 2 = 0 THEN 'Es Par' 
        ELSE 'Es Inpar' END;

SET p1 = p1 + 1;

END WHILE;

#Repeat 
SELECT 'Repeat';
REPEAT  
	SELECT CASE 
		WHEN p1 % 2 = 0 THEN 'Es Par' 
        ELSE 'Es Inpar' END;
	SET p1 = p1 + 1;
UNTIL p1 > p2
END REPEAT;

#Loop
SELECT 'Loop';
etiqueta:LOOP 	
	IF p1>p2 THEN 
		LEAVE etiqueta;
    END IF;
    SELECT IF(P1%2=0, 'es par', 'es impar'); 
    SET p1 = p1 +1 ;

END LOOP;

END;
$$










