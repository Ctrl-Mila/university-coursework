program ejercicio8;

const
    valoralto = 9999;
    dim = 16;

type
    yerba = record
        cod : integer;
        nom : string[12];
        cantH : integer;
        cantK : integer;
    end;
    maestro = file of yerba;

    det = record
        cod : integer;
        cantK : integer;
    end;
    detalle = file of det;

    detalles = array [1..dim] of detalle;
    registros = array [1..dim] of det;

procedure leerDetalle (var d : detalle; var r : det);
begin
    if (not eof (d)) then
       read (d, r)
    else
       r.cod := valoralto;
end;

procedure minimo (var d : detalles; var r : registros; var min : det);
var
   i, pos : integer;
begin
   pos := 0;
   min.cod := valoralto;
   for i := 1 to dim do
   begin
       if (r[i].cod < min.cod) then
       begin
           min := r[i];
           pos := i;
       end;
   end;

   if (pos <> 0) then
      leerDetalle (d[pos], r[pos]);
end;

procedure actualizar (var m : maestro; var d : detalles; var r : registros);
var
    min : det;
    y : yerba;
begin
    minimo (d, r, min);
    while (min.cod <> valoralto) do
    begin
        read (m, y);
        while (y.cod <> min.cod) do
            read (m, y);
        while (y.cod = min.cod) do
        begin
            y.cantK := y.cantK + min.cantK;
            minimo (d, r, min);
        end;
        seek (m, filepos (m) - 1);
        write (m, y);
    end;
    writeln ('Se termino la actualizacion');
end;

procedure imprimirEnPantalla (var m : maestro; nom : string);
var
   r : yerba;
begin
    assign (m, nom);
    reset (m);
    while (not eof(m)) do
    begin
        read (m, r);
        if (r.cantK > 10000) then
        begin
            writeln ('La provincia ', r.nom, ' con codigo ', r.cod, ' tiene mas de 10.000 kilos de yerba consumidos');
            writeln ('El promedio consumido de yerba por habitante es de ', (r.cantK DIV r.cantH), ' kilos');
        end
    end;
    close (m);
end;

var
   m : maestro;
   d : detalles;
   r : registros;
   nomF, s : string;
   i : integer;

begin
   write ('Ingresar nombre del archivo: ');
   readln (nomF);
   assign (m, nomF);

   reset (m);

   for i := 1 to dim do
   begin
       str (i, s);
       assign (d[i], 'det' + s);
       reset (d[i]);
       leerDetalle (d[i], r[i]);
   end;

   actualizar (m, d, r);

   close (m);
   for i := 1 to dim do
       close (d[i]);

   imprimirEnPantalla (m, nomF);

   writeln ('Fin del programa');
   readln;
end.
