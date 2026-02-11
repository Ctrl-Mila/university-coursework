program ejercicio3;

type
    texto = string[20];
    novela = record
        cod : integer;
        genero : texto;
        nombre : texto;
        duracion : real;
        director : texto;
        precio : real;
    end;
    archivo = file of novela;

procedure crearArchivo (var a : archivo);
var
   nom : string;
   nov : novela;

begin
    write ('Ingresar el nombre fisico del archivo: ');
    readln (nom);
    assign (a, nom);
    rewrite (a);
    //preparar la tecnica de la lista invertida
    nov.cod := 0;
    nov.genero := '';
    nov.nombre := '';
    nov.duracion := 0.0;
    nov.director := '';
    nov.precio := 0.0;
    write (a, nov);
    //cargar por teclado las novelas
    writeln ('Ingresar los datos de las novelas que se agregarán al archivo (codigo -1 para finalizar carga)');
    writeln ();
    write ('Codigo: ');
    readln (nov.cod);
    while (nov.cod <> -1) do
    begin
        write ('Genero: ');
        readln (nov.genero);
        write ('Nombre: ');
        readln (nov.nombre);
        write ('Duración: ');
        readln (nov.duracion);
        write ('Director: ');
        readln (nov.director);
        write ('Precio: $');
        readln (nov.precio);
        write (a, nov);
        writeln ();
        write ('Codigo: ');
        readln (nov.cod);
    end;
    //cerrar archivo
    writeln ();
    writeln ('Se termino la carga por teclado del archivo!');
    writeln ();
    close (a);
end;

procedure alta (var a : archivo);
var
   nov, enlace : novela;
   pos : integer;
begin
    writeln ('Ingresar los datos de la novela a dar de alta: ');
    writeln ();
    write ('Codigo: ');
    readln (nov.cod);
    write ('Genero: ');
    readln (nov.genero);
    write ('Nombre: ');
    readln (nov.nombre);
    write ('Duración: ');
    readln (nov.duracion);
    write ('Director: ');
    readln (nov.director);
    write ('Precio: $');
    readln (nov.precio);

    //chequeo si hay lugar libre (si no hay ingreso el registro al final del archivo)
    seek (a, 0);
    read (a, enlace);
    if (enlace.cod = 0) then
    begin
       seek (a, filesize(a));
       write (a, nov);
    end
    else
    begin
        //copio lo de la posicion libre en la cabecera de la lista
        pos := -enlace.cod;
        seek (a, pos);
        read (a, enlace);
        seek (a, 0);
        write (a, enlace);
        //y despues copio en la posicion libre el registro nuevo
        seek (a, pos);
        write (a, nov);
        writeln ('Se recupero un espacio libre en la posicion ', pos);
    end;
    writeln();
    writeln ('Se finalizo el alta de la novela!');
    writeln ();
end;

procedure modificar (var a : archivo);
var
   nov : novela;
   encontre : boolean;
   cod : integer;
begin
    write ('Ingresar el codigo de la novela que se desea modificar: ');
    readln (cod);

    encontre := false;
    while ((not eof (a)) and (not encontre)) do
    begin
        read (a, nov);
        if (nov.cod = cod) then
           encontre := true;
    end;

    if (encontre) then
    begin
         write ('Nuevo Genero (o ingresar el actual): ');
         readln (nov.genero);
         write ('Nuevo Nombre (o ingresar el actual): ');
         readln (nov.nombre);
         write ('Nueva Duración (o ingresar la actual): ');
         readln (nov.duracion);
         write ('Nuevo Director (o ingresar el actual): ');
         readln (nov.director);
         write ('Nuevo Precio (o ingresar el actual): $');
         readln (nov.precio);
         seek (a, filepos(a) - 1);
         write (a, nov);
         writeln ('Finalizo la modificacion!');
     end
     else
         writeln ('La novela con codigo ', cod, ' no fue encontrada');
end;

procedure eliminar (var a : archivo);
var
   cod, pos : integer;
   encontre : boolean;
   enlace, n : novela;
begin
    write ('Ingresar el codigo de la novela a eliminar del archivo (> 0): ');
    readln (cod);

    encontre := false;
    while ((not eof(a)) and (not encontre)) do
    begin
        read (a, n);
        if (n.cod = cod) then
        begin
            encontre := true;
            pos := filepos(a)-1;
        end;
    end;

    if (encontre) then
    begin
        //primero sobreescribo el registro que elimino con lo que hay en la cabecera
        seek (a, 0);
        read (a, enlace);
        seek (a, pos);
        write (a, enlace);
        //despues vuelvo al principio y le asigno la posicion (negativa) que fue eliminada
        enlace.cod := - pos;
        seek (a, 0);
        write (a, enlace);
        writeln ('Se elimino la novela!');
    end
    else
        writeln ('No se encontro la novela con el codigo ', cod, ' para eliminar');
end;

procedure mantenimiento (var a : archivo);
var
   nom : string;
   opcion : integer;

begin
    write ('Ingresar el nombre fisico del archivo: ');
    readln (nom);
    repeat
          assign (a, nom);
          reset (a);
          writeln ('El archivo esta abierto. Seleccione la operacion que desee realizar:');
          writeln ('1 - Dar de Alta una novela');
          writeln ('2 - Modificar una novela');
          writeln ('3 - Eliminar una novela');
          writeln ('4 - Terminar mantenimiento');
          readln (opcion);
          writeln ();
          case opcion of
               1 : alta (a);
               2 : modificar (a);
               3 : eliminar (a);
          end;
          close (a);
    until (opcion = 4);
    writeln ();
    writeln ('Se finalizo el mantenimiento!');
    writeln ();
end;

procedure listarEnTexto (var a : archivo);
var
   nom : string;
   t : text;
   n : novela;
begin
    write ('Ingresar el nombre fisico del archivo: ');
    readln (nom);
    assign (a, nom);
    reset (a);
    assign (t, 'novelas.txt');
    rewrite (t);

    while (not eof (a)) do
    begin
        read (a, n);
        writeln (t, 'Codigo: ', n.cod, ' Genero: ', n.genero, ' Nombre: ', n.nombre, ' Duración: ', n.duracion:0:2, ' Director: ', n.director, ' Precio: $', n.precio:0:2);
    end;
    writeln ();
    writeln ('Se termino el listado en el archivo de texto!');
    writeln ();
    close (a);
    close (t);
end;

var
   a : archivo;
   opcion : integer;

begin
    repeat
          writeln ('Menu de opciones: ');
          writeln ('1 - Crear archivo con informacion de novelas');
          writeln ('2 - Abrir el archivo y realizar operaciones/mantenimiento');
          writeln ('3 - Listar en un archivo de texto todas las novelas');
          writeln ('4 - Finalizar');
          write ('Ingresar la opcion elegida: ');
          readln (opcion);
          writeln ();

          case opcion of
               1 : crearArchivo(a);
               2 : mantenimiento(a);
               3 : listarEnTexto(a);
          end;

    until (opcion = 4);
    writeln ();
    writeln ('Fin del programa');
    readln;
end.
