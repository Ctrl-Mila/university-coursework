program Ejercicio2;

Const
	dimF = 300;

Type
	oficina = record
		codigo : integer;
		dni : integer;
		expensa : real;
	end;
	vector = array [1..dimF] of oficina;
	
procedure cargarVector (var v : vector; var dimL : integer);

	procedure leerOficina (var o : oficina);
	begin
		write ('Codigo de identificacion: ');
		readln (o.codigo);
		if (o.codigo <> -1) then
		begin
			write ('DNI del propietario: ');
			o.dni := random (9999) + 1;
			writeln (o.dni);
			write ('Valor de la expensa: $');
			o.expensa := random (1000) + 1;
			writeln (o.expensa:1:2);
		end;
	end;

var
	o : oficina;
begin
	dimL := 0;
	leerOficina (o);
	while (dimL < dimF) and (o.codigo <> -1) do
	begin
		dimL := dimL + 1;
		v[dimL] := o;
		leerOficina (o);
	end;
end;

procedure seleccion (var v : vector; dimL : integer);
var
	i, j, pos : integer;
	item : oficina;
begin
	for i := 1 to dimL - 1 do
	begin
		pos := i;
		for j := i+1 to dimL do
		begin
			if (v[j].codigo < v[pos].codigo) then
				pos := j;
		end;
		item := v[pos];
		v[pos] := v[i];
		v[i] := item;
	end;
end;

procedure imprimirVector (v : vector; dimL : integer);
var
	i : integer;
begin
	for i := 1 to dimL do
		write (v[i].codigo, ' - ');
end;

var
	v : vector;
	dimL : integer;
	
begin
	cargarVector (v, dimL);
	seleccion (v, dimL);
	writeln (' - Vector ordenado por codigo - ');
	imprimirVector (v, dimL);
end.
