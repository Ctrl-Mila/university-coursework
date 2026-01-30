{
Programming Workshop – Binary Search Trees

This exercise models a complaint management system using a
Binary Search Tree (BST) indexed by citizen ID (DNI).

Each tree node represents a unique DNI and stores:
- the total number of complaints made by that person
- a linked list containing all associated complaints

Each complaint includes:
- complaint code
- year
- type of complaint

The program demonstrates:
- insertion and update operations in a BST
- accumulation of data per key
- efficient searches by key and key range
- traversal of hierarchical structures with associated lists
- filtering data based on specific conditions

This solution highlights recursive processing, data aggregation,
and optimized queries using BST properties.
}

program Ejercicio4;

Type
	reclamo = record
		codigo : integer;
		a : integer;
		tipo : string;
	end;
	lista = ^nodo;
	nodo = record
		dato : reclamo;
		sig : lista;
	end;
	datoArbol = record
		dni : integer;
		cantTotal : integer;
		l : lista;
	end;
	arbol = ^nodoArbol;
	nodoArbol = record
		dato : datoArbol;
		HI : arbol;
		HD : arbol;
	end;
	
	
{a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para 
cada DNI se deben tener almacenados cada reclamo y la cantidad total de reclamos 
que realizó.}

procedure generarArbol (var a : arbol);

	procedure leerReclamo (var r : reclamo; var dni : integer);
	var
		tipos : array [1..3] of string = ('Producto', 'Servicio', 'Estado');
	begin
		write ('Ingresar codigo de reclamo: ');
		r.codigo := random (101);
		writeln (r.codigo);
		if (r.codigo <> 0) then
		begin
			write ('DNI: ');
			dni := random (100) * 100;
			writeln (dni);
			write ('Ingresar año en el que se realiza el reclamo: ');
			r.a := random(9) + 2011;
			writeln (r.a);
			write ('Ingresar tipo de reclamo: ');
			r.tipo := tipos[random(3)+1];
			writeln (r.tipo);
		end;
		writeln;
	end;
	
	procedure cargarLista (var l : lista; r : reclamo);
	var
		aux : lista;
	begin
		new(aux);
		aux^.dato := r;
		aux^.sig := l;
		l := aux;
	end;
	
	procedure cargarNodo (var a : arbol; r : reclamo; dni : integer);
	begin
		if (a = nil) then
		begin
			new(a);
			a^.dato.dni := dni;
			a^.dato.cantTotal := 1;
			a^.dato.l := nil;
			cargarLista (a^.dato.l, r);
			a^.HI := nil;
			a^.HD := nil;
		end
		else
		begin
			if (a^.dato.dni = dni) then
			begin
				a^.dato.cantTotal := a^.dato.cantTotal + 1;
				cargarLista (a^.dato.l, r);
			end
			else
			begin
				if (dni < a^.dato.dni) then
					cargarNodo (a^.HI, r, dni)
				else
					cargarNodo (a^.HD, r, dni);
			end;	
		end;
	end;

var
	dni : integer;
	r : reclamo;
	
begin
	a := nil;
	randomize;
	leerReclamo (r, dni);
	while (r.codigo <> 0) do
	begin
		cargarNodo (a, r, dni);
		leerReclamo (r, dni);
	end;
end;

{b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad 
de reclamos efectuados por ese DNI.}
 
procedure cantDeReclamosPorDNI (a : arbol); 

	function cantReclamos (a : arbol; dni : integer) : integer;
	begin
		if (a = nil) then
			cantReclamos := 0
		else
		begin
			if (a^.dato.dni = dni) then
				cantReclamos := a^.dato.cantTotal
			else
			begin
				if (dni < a^.dato.dni) then
					cantReclamos := cantReclamos(a^.HI, dni)
				else
					cantReclamos := cantReclamos(a^.HD, dni);
			end;
		end;
	end; 

var
	dni : integer;
begin
	writeln;
	writeln;
	write ('Ingresar un DNI para saber cuantos reclamos fueron hechos por esa persona: ');
	readln (dni);
	writeln;
	writeln ('La cantidad de reclamos efectuados por el DNI ', dni, ' fueron ', cantReclamos(a, dni));
	writeln;
	writeln;
end;

{c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad 
de reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.}

procedure cantReclamosEntreValores (a : arbol);

	function cantRecValores (a : arbol; dni1, dni2 : integer) : integer;
	begin
		if (a = nil) then
			cantRecValores := 0
		else
		begin
			if (a^.dato.dni > dni1) and (a^.dato.dni < dni2) then
				cantRecValores := a^.dato.cantTotal + cantRecValores(a^.HI, dni1, dni2) + cantRecValores (a^.HD, dni1, dni2)
			else
			begin
				if (a^.dato.dni <= dni1) then
					cantRecValores := cantRecValores(a^.HD, dni1, dni2)
				else
					cantRecValores := cantRecValores(a^.HI, dni1, dni2);
			end;
		end;
	end;

var
	dni1, dni2 : integer;
begin
	write ('Ingresar un dni menor y luego uno mayor. Se retornara la cantidad de reclamos efectuados por todos los DNI comprendidos entre estos valores: ');
	read (dni1);
	write (' - ');
	readln (dni2);
	writeln;
	writeln ('La cantidad de reclamos efectuados por todos los DNI comprendidos entre ', dni1, ' y ', dni2, ' es de ', cantRecValores(a, dni1, dni2));
	writeln;
	writeln;
end;

{d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos 
de los reclamos realizados en el año recibido.}

procedure retornarCodRecA (a : arbol);

	procedure recorrerListaEInformar (l : lista; year : integer);
	begin
		while (l <> nil) do
		begin
			if (l^.dato.a = year) then
				write (l^.dato.codigo, ' - ');
			l := l^.sig;
		end;
	end;
	
	procedure recorrerArbol (a : arbol; year : integer);
	begin
		if (a <> nil) then
		begin
			recorrerArbol (a^.HI, year);
			recorrerListaEInformar (a^.dato.l, year);
			recorrerArbol (a^.HD, year);
		end;
	end;
	
var
	year : integer;
begin
	write ('Ingresar un año para buscar los codigos de reclamos hechos en el: ');
	readln (year);
	writeln; 
	writeln ('Los codigos de los reclamos realizados en el año ', year, ' son: ');
	recorrerArbol (a, year);
	writeln;
end;

var
	a : arbol;
	
begin
	generarArbol (a);
	if (a = nil) then
		writeln ('Arbol vacio')
	else
	begin
		cantDeReclamosPorDNI (a);
		cantReclamosEntreValores (a);
		retornarCodRecA (a);
	end;
end.
