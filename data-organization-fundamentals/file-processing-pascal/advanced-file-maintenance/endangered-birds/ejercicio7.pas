program ejercicio7;

const
     valorBaja = -1;

type
    texto = string[12];
    aves = record
        cod : integer;
        nom : texto;
        familia : texto;
        descp : texto;
        zona : integer;
    end;
    archivo = file of aves;

procedure bajafisica1 (var a : archivo);
var
    ave : aves;
    pos : integer;
begin
    reset(a);
    while (not eof(a)) do
    begin
        read (a, ave);
        if (ave.cod = valorBaja) then
        begin
            pos := filepos(a)-1;
            if (pos <> filesize(a)-1) then
            begin
                 seek (a, filesize(a)-1);
                 read (a, ave);
                 seek (a, pos);
                 write (a, ave);
                 seek (a, filesize(a)-1);
            end;
            truncate (a);
            seek (a, pos);   
        end;
    end;
    writeln ();
    writeln ('Se termino la baja fisica (opcion 1)');
    writeln();
    close(a);
end;

procedure bajafisica2 (var a : archivo);
var
    ave : aves;
    pos, posFinal : integer;
begin
    reset(a);
    posFinal := filesize(a);
    while (not eof(a)) and (filepos(a) <> posFinal) do
    begin
        read (a, ave);
        if (ave.cod = valorBaja) then
        begin
            pos := filepos(a) - 1;
            posFinal := posFinal -1;
            if (pos <> posFinal) then
            begin
                seek(a, posFinal);
                read (a, ave);
                seek (a, pos);
                write (a, ave);
            end;
            seek (a, pos);
        end;
    end;
    seek (a, posFinal);
    truncate (a);
    writeln ();
    writeln ('Se termino la baja fisica (opcion 2)');
    writeln();
    close(a);
end;

procedure bajalogica (var a : archivo);
var
   cod : integer;
   ave : aves;
   encontre : boolean;
begin
    reset (a);
    write ('Ingrese el codigo de la especie que desea eliminar del archivo: ');
    readln (cod);
    encontre := false;
    while ((not eof(a)) and (not encontre)) do  //si el archivo tuviera repeticiones
    begin                                      //sacaría de la condicion el encontre
        read (a, ave);                         //para que lo haga todas las veces que
        if (ave.cod = cod) then                //encuentre el codigo correcto
        begin
            ave.cod := valorBaja;
            seek (a, filepos(a)-1);
            write (a, ave);
            encontre := true;
        end;
    end;

    if (encontre) then
        writeln ('Se elimino la especie logicamente!')
    else
        writeln ('No se encontro la especie de ave con codigo ', cod);

    close (a);
end;

var
   a : archivo;
   nom : string;
   opcion : integer;
begin
    write ('Ingresar nombre fisico del archivo de aves: ');
    readln (nom);
    assign (a, nom);
    writeln ();
    repeat
          writeln ('Opciones: ');
          writeln ('1 - Baja logica de datos');
          writeln ('2 - Baja fisica de datos (opcion1)');
          writeln ('3 - Baja fisica de datos (opcion2)');
          writeln ('4 - Terminar');
          write ('Opcion: ');
          readln (opcion);

          case opcion of
               1 : bajalogica (a);
               2 : bajafisica1 (a);
               3 : bajafisica2 (a);
          end;
    until (opcion = 4);
    writeln ();
    writeln ('Fin del programa');
    readln;
end.
