/* MDT 5

Queremos agregar un nuevo atributo a la tabla de empleados llamado Edad. Una vez que
hayamos hecho el cambio en la estructura de la tabla, debemos rellenar la información para
cada uno de los empleados. Para ello, vamos a crear una función que se llame edad(),
donde recibe por parámetro una fecha de nacimiento determinada y calcula la edad. Por
último, para actualizar los datos físicamente en nuestra tabla, vamos a generar un stored
procedure que se llame actualizar_edad() donde vamos a actualizar la edad de todos los
empleados. Esta nos servirá para ejecutarla una vez al año y actualizar las edades de todos
los empleados nuevamente
*/

Delimiter  $$
create function calcularEdad(fecha date)
returns tinyint 
deterministic
Begin
declare edad tinyint;
set edad = (SELECT timestampdiff(YEAR, fecha, curdate()));
return edad;
end
$$


Delimiter $$
create procedure actualizarEdad()
Begin
Select 
empleados.nombre,
empleados.apellido, 
empleados.fecha_nacimiento,
calcularEdad(empleados.fecha_nacimiento) as edad
from empleados;
end $$

call actualizarEdad();



