{
Programming Workshop – Binary Search Trees

This exercise models academic exam records using a Binary Search Tree (BST)
combined with linked lists.

Each tree node represents a student identified by a unique student ID,
while each student stores a list of final exams taken, including subject code,
date, and grade.

The program demonstrates:
- insertion into a binary search tree based on student ID
- use of linked lists to store multiple records per node
- recursive tree traversal and processing
- calculation of statistics such as approved exams and grade averages

This solution reinforces the use of dynamic data structures
and recursive algorithms in hierarchical data modeling.
}

program Ejercicio3;

Type
	dia = 1..31;
	mes = 1..12;
	anio = 2014..2024;
	fecha = record
		d : dia;
		m : mes;
		a : anio;
	end;
	
	finales = record
		codigo : integer;
		f : fecha; 
		nota : real;
	end;
	
	datoALeer = record
		legajo : integer;
		fin : finales;
	end;
	
	lista = ^nodo;
	nodo = record
		f : finales;
		sig : lista;
	end;
	alumno = record
		legajo : integer;
		l : lista;
	end;
	
	arbol = ^nodoarbol;
	nodoarbol = record
		dato : alumno;
		HI : arbol;
		HD : arbol;
	end;

{a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
 Informática y los almacene en una estructura de datos. La información que se lee es legajo,
 código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
 generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
 guardarse los finales que rindió en una lista.}

procedure generarArbol (var a : arbol);

	procedure leerFecha (var f : fecha);
	begin
		f.d := random(31) + 1;
		write (f.d, '/');
		f.m := random(12) + 1;
		f.a := random(11) + 2014;
		write (f.m, '/', f.a);
	end;

	procedure leerAlumno (var dato : datoALeer);
	begin
		write ('Ingresar el legajo del alumno (0 para finalizar): ');
		dato.legajo := random(40);
		writeln (dato.legajo);
		if (dato.legajo <> 0) then
		begin 
			write ('Ingresar el codigo de la materia rendida: ');
			dato.fin.codigo := random(20) + 1;
			writeln (dato.fin.codigo);
			write ('Ingresar fecha (dia/mes/year): ');
			leerFecha (dato.fin.f);
			write ('Ingresar la nota obtenida por el alumno: ');
			dato.fin.nota := random (10) + 1;
			writeln (dato.fin.nota:1:2);
		end;
	end;

	procedure cargarLista (var l : lista; f : finales);
	var
		aux : lista;
	begin
		new (aux);
		aux^.f := f;
		aux^.sig := l;
		l := aux;
	end;
	
	procedure cargarArbol (var a : arbol; dato : datoALeer);
	begin
		if (a = nil) then
		begin
			new(a);
			a^.dato.legajo := dato.legajo;
			a^.dato.l := nil;
			cargarLista (a^.dato.l, dato.fin);
			a^.HI := nil;
			a^.HD := nil;
		end
		else
		begin
			if (a^.dato.legajo = dato.legajo) then
				cargarLista (a^.dato.l, dato.fin)
			else
			begin
				if (a^.dato.legajo > dato.legajo) then
					cargarArbol (a^.HI, dato)
				else
					cargarArbol (a^.HD, dato);
			end;
		end;
	end;

var
	dato : datoALeer;
begin
	randomize;
	leerAlumno (dato);
	while (dato.legajo <> 0) do
	begin
		cargarArbol (a, dato);
		leerAlumno (dato);
	end;
end;

{b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
 legajo impar.}

function cantidadConLegajoImpar (a : arbol) : integer;
begin
	if (a = nil) then
		cantidadConLegajoImpar := 0
	else
	begin
		if (a^.dato.legajo MOD 2 <> 0) then
			cantidadConLegajoImpar := 1 + cantidadConLegajoImpar (a^.HI) + cantidadConLegajoImpar(a^.HD)
		else
			cantidadConLegajoImpar := cantidadConLegajoImpar(a^.HI) + cantidadConLegajoImpar(a^.HD);
	end;
end;

{c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
 su cantidad de finales aprobados (nota mayor o igual a 4).}

procedure informarLegajoYCantFinalesAprobados (a : arbol);

	function contarFinalesAprobados (l : lista) : integer;
	var
		cant : integer;
	begin
		cant := 0;
		while (l <> nil) do
		begin
			if (l^.f.nota >= 4) then
				cant := cant + 1;
			l := l^.sig;
		end;
		contarFinalesAprobados := cant;
	end;

begin
	if (a <> nil) then
	begin
		informarLegajoYCantFinalesAprobados (a^.HI);
		writeln ('El alumno con legajo ', a^.dato.legajo, ' tiene ', contarFinalesAprobados(a^.dato.l), ' finales aprobados (con nota mayor o igual a 4)');
		informarLegajoYCantFinalesAprobados (a^.HD);
	end;
end;

{d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
 retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

procedure retornarLegajosYPromedios (a : arbol; valor : real);
	
	function promedio (l : lista) : real;
	var
		suma : real;
		cant : integer;
	begin
		cant := 0;
		suma := 0;
		while (l <> nil) do 
		begin
			suma := suma + l^.f.nota;
			cant := cant + 1;
			l := l^.sig;
		end;
		promedio := suma / cant;
	end;

var
	prom : real;
begin
	if (a <> nil) then
	begin
		retornarLegajosYPromedios (a^.HI, valor);
		prom := promedio (a^.dato.l);
		if (prom > valor) then
			writeln ('Legajo ', a^.dato.legajo, ' - Promedio ', prom:1:2);
		retornarLegajosYPromedios (a^.HD, valor);
	end;
end;

var
	a : arbol;
	valor : real;
	
begin
	generarArbol (a);
	writeln ('La cantidad de alumnos que poseen legajo impar es ', cantidadConLegajoImpar (a));
	informarLegajoYCantFinalesAprobados (a);
	write ('Ingresar un valor para comparar con los promedios de los alumnos: ');
	readln (valor);
	writeln ('Los alumnos que tienen un promedio que supera el valor ingresado son: ');
	retornarLegajosYPromedios (a, valor);
end.
