{
  Exercise: Netflix Movies – Insertion Sort

  Description:
  The program processes a list of movies available on Netflix, grouped by genre.
  For each genre, it identifies the movie with the highest average rating and stores
  the results in a vector, which is then sorted using the insertion sort algorithm
  based on the rating.

  Main concepts applied:
  - Linked lists grouped by category
  - Arrays
  - Modular programming
  - Insertion sort algorithm
  - Traversal and aggregation of data structures

  Language: Pascal
}

program Ejercicio3;

Const
	max = 8; 

Type
	rango1 = 1..max;
	pelicula = record
		codigo : integer;
		puntajeprom : real;
	end;
	lista = ^nodo;
	nodo = record
		p : pelicula;
		sig : lista;
	end;
	vector = array [rango1] of lista;
	puntajes = array [rango1] of pelicula;
	
procedure cargarVector (var v : vector);

	procedure iniciarListas (var v : vector; var punteros : vector);
	var
		i : integer;
	begin
		for i := 1 to max do
		begin
			v[i] := nil;
			punteros[i] := nil;
		end;
	end;

	procedure leerPelicula (var p : pelicula);
	begin
		write ('Codigo de pelicula -> ');
		readln (p.codigo);
		if (p.codigo <> -1) then
		begin
			write ('Puntaje promedio otorgado por las criticas -> ');
			p.puntajeprom := random (10) + 1;
			writeln (p.puntajeprom:1:2);
		end;
	end;

	procedure cargarLista (var l : lista; var pU : lista; p : pelicula);
	var
		aux : lista;
	begin
		new (aux);
		aux^.p := p;
		aux^.sig := nil;
		if (l = nil) then
		begin
			l := aux;
			pU :=aux;
		end
		else
		begin
			pU^.sig := aux;
			pU := aux; 
		end;
	end;
	
var
	p : pelicula;
	punteros : vector;
	genero : rango1;
begin
	randomize;
	iniciarListas (v, punteros);
	leerPelicula (p);
	while (p.codigo <> -1) do
	begin
		write ('Codigo de genero (1: acción 2: aventura 3: drama 4: suspenso 5: comedia 6: bélico 7: documental 8: terror) -> ');
		genero := random (8) + 1;
		writeln (genero);
		cargarLista (v[genero], punteros[genero], p);
		leerPelicula (p);
	end;
end;

procedure nuevoVector (var vec : puntajes; v : vector);

	procedure mayorPuntaje (l : lista; var p : pelicula);
	var
		max : real;
	begin
		max := -1;
		if (l = nil) then
		begin
			p.puntajeprom := max;
			p.codigo := -1;
		end
		else
		begin
			while (l <> nil) do 
			begin
				if (l^.p.puntajeprom > max) then
				begin
					max := l^.p.puntajeprom;
					p := l^.p;
				end;
				l := l^.sig;
			end;
		end;
	end;
	
var
	i : integer;
	p : pelicula;
begin
	for i := 1 to max do
	begin
		mayorPuntaje (v[i], p);
		vec[i] := p;
	end;
end;

procedure ordenar (var vec : puntajes);
var
	i, j : rango1;
	actual : pelicula;
begin
	for i := 2 to max do
	begin
		actual := vec[i];
		j := i - 1;
		while (j > 0) and (vec[j].puntajeprom > actual.puntajeprom) do
		begin
			vec[j+1] := vec[j];
			j := j - 1;
		end;
		vec[j+1] := actual;
	end;
end;

procedure imprimirVector (vec : puntajes);
var
	i : rango1;
begin
	for i := 1 to max do
		writeln ('Codigo de pelicula -> ', vec[i].codigo, ' | Puntaje -> ', vec[i].puntajeprom:1:2);
end;

procedure mayorYmenorPuntaje (vec : puntajes);
var 
	i : rango1;
begin
	i := 1;
	while (i < max) and (vec[i].puntajeprom = -1) do			
		i := i + 1;
	if (vec[i].puntajeprom <> -1) then
	begin
		writeln ('El codigo de pelicula con menor puntaje es ', vec[i].codigo);
		writeln ('El codigo de pelicula con mayor puntaje es ', vec[max].codigo);
	end
	else
		writeln ('El vector esta vacio');
end;

var
	v : vector;
	vec : puntajes;
begin
	cargarVector (v);
	nuevoVector (vec, v);
	writeln ('  -- Vector nuevo de puntajes  -- ');
	imprimirVector (vec);
	ordenar (vec);
	writeln ('  -- Vector ordenado por puntaje -- ');
	imprimirVector (vec);
	mayorYmenorPuntaje (vec);
end.
