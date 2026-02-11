program ejercicio6;

const
    valorBaja = -1;

type
    prenda = record
        cod : integer;
        descp : string;
        colores : string;
        tipo : string;
        stock : integer;
        preciouni : real;
    end;
    maestro = file of prenda;
    archivo = file of integer;

procedure bajalogica (var m : maestro; var a : archivo);
var
    cod : integer;
    encontre : boolean;
    p : prenda;
begin
    reset (a);
    reset (m);
    while (not eof(a)) do
    begin
         read (a, cod);
         seek (m, 0);
         encontre := false;
         while ((not eof (m)) and (not encontre)) do
         begin
             read (m, p);
             if (p.cod = cod) then
                encontre := true;
         end;
         if (encontre) then
         begin
              p.stock := valorBaja;
              seek (m, filepos(m)-1);
              write (m, p);
         end;
    end;
    close (m);
    close (a);
end;

procedure bajafisica (var m : maestro; var nuevo : maestro);
var
    p : prenda;
begin
    reset (m);
    rewrite (nuevo);

    while (not eof(m)) do
    begin
        read (m, p);
        if (p.stock <> valorBaja) then
           write (nuevo, p);
    end;

    close (m);
    close (nuevo);
end;

var
    m, nuevo : maestro;
    a : archivo;
    nom, nomOriginal : string;

begin
    write ('Ingresar el nombre fisico del archivo maestro: ');
    readln (nomOriginal);
    assign (m, nomOriginal);
    writeln();
    write ('Ingresar el nombre fisico del archivo con actualizaciones: ');
    readln (nom);
    assign (a, nom);
    writeln ();
    writeln ('Se realizara la actualizacion del archivo maestro');
    writeln ();
    bajalogica (m, a);
    writeln ('Se realizo la baja logica. Ahora se hara efectiva');
    write ('Ingresar el nombre del archivo nuevo que se usara para la compactacion: ');
    readln (nom);
    assign (nuevo, nom);
    bajafisica (m, nuevo);  
    Erase (m);
    Rename (nuevo, nomOriginal);
    writeln ();
    writeln ('Se completo la asignacion del nuevo archivo al original');
    writeln ();
    writeln ('Fin del programa');
    readln;
end.
