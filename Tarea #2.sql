--1. Visualizar las iniciales de un nombre
set serveroutput on;
DECLARE
    --Declarando Variables
    nombre varchar2(100);
    apellido1 varchar2(100);
    apellido2 varchar(100);
begin
    --Asignando nombres a las variables
    nombre := 'alberto';
    apellido1 := 'perez';
    apellido2 := 'garcia';
    --Salida en la consola
    dbms_output.put_line(upper(substr(nombre, 1,1))||'.'||upper(substr(apellido1, 1, 1))||'.'||upper(substr(apellido2, 1, 1)));
end;

--2. Determinar si un numero es par o es impar
set serveroutput on;
declare
    number int;
begin
    number := 3;
    dbms_output.put_line('El numero que evaluare es = ' || number);
    if mod (number, 2) = 0 then
        dbms_output.put_line('Este numero es par');
    else
        dbms_output.put_line('Este numero es impar');
    end if;
end;

--3. Devolver el salario maximo del departamento 100 por medio de una variable
set serveroutput on;
declare
    salario_maximo employees.salary%type;
begin
    select max (employees.salary) into salario_maximo from employees where department_id=100;
    dbms_output.put_line ('Salario maximo en el Departamento 100 = ' || salario_maximo || '$');
end;

--4. Visualizar el nombre del departamento y la cantidad de empleados que tiene
set serveroutput on;
declare
    departamento departments.department_id%TYPE :=10; --Valor ya asignagnado por el ejercicio
    --Variables que almacenaran la cantidad de empleados y el nombre del departamento en el que trabajan
    nEmpleados employees.department_id%type;
    nombreDepartamento departments.department_name%type;
begin
    --Asignando valores a las 2 variables
    select count (employees.employee_id) into nEmpleados from employees where employees.department_id=departamento;
    select departments.department_name into nombreDepartamento from departments where department_id = departamento;
    --Salida en la consola
    dbms_output.put_line('Informacion del Departamento No ' || departamento);
    dbms_output.put_line('Nombre del Departamento = ' || nombredepartamento);
    dbms_output.put_line('Numero de Empleados presentes = ' || nEmpleados);
end;

--5. Recuperar el salario maximo y minimo de la empresa, indicar la diferencia
set serveroutput on;
declare
    salarioMaximo employees.salary%type;
    salarioMinimo employees.salary%type;
begin
    select max (employees.salary) into salarioMaximo from employees;
    select min (employees.salary) into salarioMinimo from employees;
    dbms_output.put_line('El salario maximo que cobra un empleado en la empresa es = ' || salarioMaximo || '$');
    dbms_output.put_line('El salario minimo que cobra un empleado en la empresa es = ' || salarioMinimo || '$');
    dbms_output.put_line('La diferencia entre los dos salarios es de ' || (salarioMaximo - salarioMinimo) || '$');
end;