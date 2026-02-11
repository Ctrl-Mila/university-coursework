program ejercicio8;

type
    texto = string[12];
    distriLinux = record
        nom : texto;
        lanz : integer;
        num : integer;
        cant : integer;
        descp : texto;
    end;
    archivo = file of distriLinux;

procedure buscarDistribucion (var a : archivo; nom : texto; var pos : integer);
var
   encontre : boolean;
   d : distriLinux;
begin
    encontre := false;
    while ((not eof(a)) and (not encontre)) do
    begin
        read (a, d);
        if (d.nom = nom) then
        begin
            encontre := true;
            pos := filepos(a)-1;
        end;
    end;
    if (not encontre) then
       pos := -1;
end;

procedure altaDistribucion (var a : archivo; dis : distriLinux);
var
    pos : integer;
    d : distriLinux;
begin
    reset (a);
    writeln ();
    buscarDistribucion (a, dis.nom, pos);
    if (pos = -1) then
    begin
        seek (a, 0);
        read (a, d);
        if (d.cant = 0) then
        begin
           seek (a, filesize(a));
           write (a, dis);
        end
        else
        begin
            pos := -d.cant;
            seek (a, pos);
            read (a, d);
            seek (a, 0);
            write (a, d);
            seek (a, pos);
            write (a, dis);
            writeln ('Se aprovecho el espacio de la posicion ', pos);
        end;
        writeln ('Se dio de alta exitosamente la distribucion!');
    end
    else
        writeln ('Ya existe la distribucion con ese nombre en el archivo');
    writeln ();
    close (a);
end;

procedure bajaDistribucion (var a : archivo; nom : texto);
var
    pos : integer;
    d : distriLinux;
begin
    reset (a);
    writeln ();
    buscarDistribucion(a, nom, pos);
    if (pos <> -1) then
    begin
       seek (a, 0);
       read (a, d);
       seek (a, pos);
       write (a, d);
       seek (a, 0);
       d.cant := -pos;
       write (a, d);
       writeln ('Se dio de baja exitosamente!');
    end
    else
        writeln ('La distribucion buscada no existe en el archivo');
    writeln ();
    close (a);
end;

var
    a : archivo;
    nom : texto;
    opcion : integer;
    dis : distriLinux;

begin
    write ('Ingresar el nombre del archivo de distribuciones de Linux: ');
    readln (nom);
    assign (a, nom);
    repeat
         writeln ();
         writeln ('Opciones de mantenimiento del archivo:');
         writeln ('1 - Darle de baja a una Distribucion');
         writeln ('2 - Darle de alta a una Distribucion');
         writeln ('3 - Terminar');
         write ('Ingrese su opcion: ');
         readln (opcion);
         writeln ();
         case opcion of
              1 : begin
                      write ('Ingresar el nombre de la distribucion a dar de baja: ');
                      readln (nom);
                      bajaDistribucion (a, nom);
                  end;
              2 : begin
                      writeln ('Ingrese los datos de la distribucion a dar de alta: ');
                      write ('Nombre: ');
                      readln (dis.nom);
                      write ('Año de lanzamiento: ');
                      readln (dis.lanz);
                      write ('Numero de version del kernel: ');
                      readln (dis.num);
                      write ('Cantidad de desarrolladores: ');
                      readln (dis.cant);
                      write ('Descripcion: ');
                      readln (dis.descp);
                      altaDistribucion (a, dis);
                  end;
         end;

    until (opcion = 3);
    writeln ();
    writeln ('Fin del programa');
    readln;
end.
