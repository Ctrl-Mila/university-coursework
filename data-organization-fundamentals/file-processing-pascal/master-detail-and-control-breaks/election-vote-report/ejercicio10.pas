program ejercicio10;

const
     valoralto = 9999;

type
     votos = record
         prov : integer;
         loc : integer;
         mesa : integer;
         cantVotos : integer;
     end;
     maestro = file of votos;

procedure leer (var m : maestro; var v : votos);
begin
    if (not eof(m)) then
       read (m, v)
    else
       v.prov := valoralto;
end;

procedure informar (var m : maestro);
var
   v : votos;
   prov, loc, totalp, totall, general : integer;
begin
    leer (m, v);
    general := 0;
    while (v.prov <> valoralto) do
    begin
        prov := v.prov;
        totalp := 0;
        writeln ('Codigo de Provincia -> ', prov);
        while (prov = v.prov) do
        begin
            loc := v.loc;
            totall := 0;
            write ('Codigo de Localidad -> ', loc, '         Total de Votos: ');
            while ((prov = v.prov) and (loc = v.loc)) do
            begin
                totall := totall + v.cantVotos;
                leer (m, v);
            end;
            writeln (totall);
            totalp := totalp + totall;
        end;
        writeln ('Total de Votos en la Provincia: ', totalp);
        general := general + totalp;
    end;
    writeln ('Total General de Votos: ', general);
    writeln ();
    writeln ('Se termino el informe!');
    readln;
end;

var
   m : maestro;
   nom : string;

begin
   write ('Ingresar el nombre del archivo maestro: ');
   readln (nom);

   assign (m, nom);
   reset (m);

   informar (m);

   close (m);
   writeln ('Fin del programa');
   readln;
end.
