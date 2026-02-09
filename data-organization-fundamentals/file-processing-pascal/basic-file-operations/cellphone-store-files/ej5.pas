program ej5;

type
	texto = string[30];
	celulares = record
		cod : integer;
		nombre : texto;
		descp : texto;
		marca : texto;
		precio : real;
		stockMin : integer;
		stockDisp : integer;
	end;
	archivoCelulares = file of celulares;

procedure crearArchivo;
var
	nomFisico: string;
	a : archivoCelulares;
	t : text;
	cel : celulares;
begin
	write ('Ingrese nombre del archivo binario: ');
	readln (nomFisico);
	assign (a, nomFisico);
	rewrite (a);

	assign (t, 'celulares.txt');
	reset (t);

	while (not eof(t)) do
	begin
		readln (t, cel.cod, cel.precio, cel.marca);
		readln (t, cel.stockMin, cel.stockDisp, cel.descp);
		readln (t, cel.nombre);
		write(a, cel);
	end;

	close (a);
	close (t);

	writeln ('Termino la creacion');
end;


procedure mostrarStockMenor;
var
	nomFisico: string;
	a : archivoCelulares;
	c : celulares;
begin
	write ('Ingrese nombre del archivo binario: ');
	readln (nomFisico);
	assign (a, nomFisico);
	reset (a);

	writeln ('Los celulares que tienen menor stock que su minimo son: ');
	while (not eof(a)) do
	begin
		read(a, c);
		if (c.stockDisp < c.stockMin) then
			writeln ('- ', c.nombre);
	end;

	close (a);

	writeln ('Finalizo la impresion');
end;

procedure mostrarDesc;
var
	nomFisico: string;
	a : archivoCelulares;
	cadena : texto;
	c : celulares;
begin
	write ('Ingrese nombre del archivo binario: ');
	readln (nomFisico);
	assign (a, nomFisico);
	reset (a);

	write ('Ingrese el texto a chequear en la descripcion: ');
	readln (cadena);

	writeln ('Los celulares que en su descripcion contienen ese texto son: ');
	while (not eof(a)) do
	begin
		read (a, c);
		if (Pos(cadena, c.descp) > 0) then
			writeln ('- ', c.nombre, ' - ', c.marca, ' - ', c.cod);
	end;

	close (a);

	writeln ('Finalizo la impresion');
end;

procedure exportar;
var
	nomFisico: string;
	a : archivoCelulares;
	t : text;
	c : celulares;
begin
	write ('Ingrese nombre del archivo binario: ');
	readln (nomFisico);
	assign (a, nomFisico);
	reset (a);

	assign (t, 'celulares.txt');
	rewrite (t);

	while (not eof(a)) do
	begin
		read (a, c);
		writeln (t, c.cod, ' ', c.precio:1:2, ' ', c.marca);
		writeln (t, c.stockMin, ' ', c.stockDisp, ' ', c.descp);
		writeln (t, c.nombre);
	end;

	close (a);
	close (t);

	writeln ('Finalizo la exportacion');
end;

var
	opcion : integer;

begin
	repeat
		writeln('MENU:');
		writeln ('1 - Crear un archivo y cargarlo con informacion de celulares desde un archivo de texto');
		writeln ('2 - Listar en pantalla aquellos celulares que tengan menos stock que el minimo');
		writeln ('3 - Listar en pantalla los celulares del archivo cuya descripción contenga una cadena de caracteres que se proporciona');
		writeln ('4 - Exportar todo el archivo a uno de texto');
		writeln ('5 - Terminar');
		write ('Elija una opcion: ');
		readln (opcion);
		case opcion of
			1 : crearArchivo;
			2 : mostrarStockMenor;
			3 : mostrarDesc;
			4 : exportar;
		end;
	until (opcion = 5);

	writeln ('Fin del programa');
end
