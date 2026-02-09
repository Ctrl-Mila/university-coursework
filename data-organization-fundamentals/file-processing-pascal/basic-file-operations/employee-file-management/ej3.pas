program ej3;

type
    empleado = record
      num : integer;
      apellido : string[15];
      nombre : string[15];
      edad : integer;
      dni : string[8];
    end;
    archivo = file of empleado;

procedure crearArchivo;
var
   arch_emp : archivo;
   emp : empleado;
   nomFisico : string;
begin
     write ('Nombre fisico del archivo: ');
     readln (nomFisico);
     assign (arch_emp, nomFisico);
     rewrite (arch_emp);
     write ('Apellido ("fin" para terminar): ');
     readln (emp.apellido);
     while (emp.apellido <> 'fin') do
     begin
          write ('Nombre: ');
          readln (emp.nombre);
          write ('Numero de empleado: ');
          readln (emp.num);
          write ('Edad: ');
          readln (emp.edad);
          write ('DNI: ');
          readln (emp.dni);
          write (arch_emp, emp);
          write ('Apellido ("fin" para terminar): ');
          readln (emp.apellido);
     end;
     close (arch_emp);
     writeln ('Archivo creado y cargado');
     readln;
end;

procedure mostrarEmpleado;
var
   buscado : string[15];
   emp : empleado;
   arch_emp : archivo;
   nomFisico : string;
begin
   write ('Nombre fisico del archivo: ');
   readln (nomFisico);
   assign (arch_emp, nomFisico);
   reset (arch_emp);
   write ('Ingresar el nombre o apellido del empleado a buscar: ');
   readln (buscado);
   writeln;
   while (not eof(arch_emp)) do
   begin
        read (arch_emp, emp);
        if (emp.apellido = buscado) or (emp.nombre = buscado) then
           writeln (emp.nombre, ' ', emp.apellido, ', ', emp.edad, ' años. Nro de empleado ', emp.num, ', DNI ', emp.dni);
   end;
   writeln;
   close (arch_emp);
   writeln ('Ya se mostraron los empleados correspondientes');
   readln;
end;

procedure mostrarTodos;
var
   emp : empleado;
   nomFisico : string;
   arch_emp : archivo;
begin
   write ('Nombre fisico del archivo: ');
   readln (nomFisico);
   assign (arch_emp, nomFisico);
   reset (arch_emp);
   while (not eof(arch_emp)) do
   begin
        read (arch_emp, emp);
        writeln (emp.nombre, ' ', emp.apellido, ', ', emp.edad, ' años. Nro de empleado ', emp.num, ', DNI ', emp.dni);
   end;
   writeln;
   close (arch_emp);
   writeln ('Termino la muestra de empleados');
   readln;
end;

procedure mayores70;
var
   emp : empleado;
   nomFisico : string;
   arch_emp : archivo;
begin
   write ('Nombre fisico del archivo: ');
   readln (nomFisico);
   assign (arch_emp, nomFisico);
   reset (arch_emp);
   writeln ('Los empleados proximos a jubilarse son: ');
   while (not eof(arch_emp)) do
   begin
        read (arch_emp, emp);
        if (emp.edad > 70) then
           writeln (emp.nombre, ' ', emp.apellido, ', ', emp.edad, ' años. Nro de empleado ', emp.num, ', DNI ', emp.dni);
   end;
   writeln;
   close (arch_emp);
   writeln ('Ya no hay mas empleados proximos a jubilarse');
   readln;
end;

var
   opcion : integer;

begin
     repeat
         writeln('MENU DE OPCIONES');
         writeln('1 - Crear archivo de empleados');
         writeln('2 - Buscar empleados por nombre o apellido');
         writeln('3 - Mostrar todos los empleados');
         writeln('4 - Listar empleados mayores de 70 años');
         writeln('5 - Salir');
         write('Seleccione una opción: ');
         readln(opcion);

         case opcion of
              1 : crearArchivo;
              2 : mostrarEmpleado;
              3 : mostrarTodos;
              4 : mayores70;
         end;

     until (opcion = 5);

   writeln ('Fin del programa');
   readln;
end.
