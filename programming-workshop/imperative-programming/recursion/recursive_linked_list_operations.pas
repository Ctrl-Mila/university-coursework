{
Programming Workshop – Recursion

This exercise focuses on the use of recursion to process linked lists.
It covers the generation, traversal, and analysis of dynamic data structures
using recursive techniques.

The program implements:
- recursive generation of a linked list with random integer values
- recursive traversal of the list in forward and reverse order
- recursive computation of the minimum value stored in the list
- recursive search for a specific value within the list

The goal is to reinforce the understanding of recursion applied to
dynamic structures and problem decomposition.
}

program Ejercicio2;

Const
	min = 100;
	max = 200;

Type
	lista = ^nodo;
	nodo = record
		dato : integer;
		sig : lista;
	end;
	
{a. Implemente un módulo recursivo que genere y retorne una lista de números 
enteros “random” en el rango 100-200. Finalizar con el número 100.}

procedure generarListaRecursivo (var l : lista); 
	
	procedure agregarEnLista (var l : lista; num : integer);
	var
		aux : lista;
	begin
		new (aux);
		aux^.dato := num;
		aux^.sig := l;
		l := aux;
	end;
var
	num : integer;
begin
	num := min + random (max-min+1);
	write (' | ', num); 
	if (num <> 100) then
	begin
		agregarEnLista (l, num);
		generarListaRecursivo (l^.sig);
	end;
end;

{b. Un módulo recursivo que reciba la lista generada en a) e imprima los 
valores de la lista en el mismo orden que están almacenados.}

procedure imprimirEnOrdenRec (l : lista);
begin
	if (l <> nil) then
	begin
		write (' | ', l^.dato);
		imprimirEnOrdenRec (l^.sig);
	end;
end;

{c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima 
los valores de la lista en orden inverso al que están almacenados.}

procedure imprimirInversoRec (l : lista);
begin
	if (l <> nil) then
	begin
		imprimirInversoRec (l^.sig);
		write (' | ', l^.dato);
	end;
end;

{d. Implemente un módulo recursivo que reciba la lista generada en a) y 
devuelva el mínimo valor de la lista.}

procedure valorMinimoRecursivo (l : lista; var minimo : integer);
begin
	if (l <> nil) then
	begin
		if (l^.dato < minimo) then
			minimo := l^.dato;
		valorMinimoRecursivo (l^.sig, minimo);
	end;
end; 

{
function valorMinimoRecursivo (l : lista) : integer;

	function minimo (l : lista; var mini : integer) : integer;
	begin
		if (l <> nil) then
		begin
			if (l^.dato < mini) then
				mini := l^.dato;
			minimo := minimo (l^.sig, mini);
		end
		else
			minimo := mini;
	end; 

var
	mini : integer;
begin
	mini := 9999;
	valorMinimoRecursivo := minimo (l, mini);
end;
}

{e. Implemente un módulo recursivo que reciba la lista generada en a) y un 
valor y devuelva verdadero si dicho valor se encuentra en la lista o falso en 
caso contrario.}

procedure buscarValorRecursivo (l : lista; valor : integer; var encontre : boolean);
begin
	if (l <> nil) and (l^.dato <> valor) then
	begin
		buscarValorRecursivo (l^.sig, valor, encontre);
	end
	else
	begin
		if (l <> nil) and (l^.dato = valor) then
			encontre := true;
	end;
end;

{
function buscarValorRecursivo (l: lista; valor : integer) : boolean;
begin
	if (l <> nil) and (l^.dato <> valor) then
		buscarValorRecursivo := buscarValorRecursivo (l^.sig, valor)
	else
	begin
		if (l <> nil) and (l^.dato = valor) then
			buscarValorRecursivo := true
		else
			buscarValorRecursivo := false;
	end;
end;
}

var
	l : lista;
	valor, minimo : integer; 
	encontre : boolean;
	
begin
	l := nil;
	randomize;
	writeln ('Valores random para la lista:');
	generarListaRecursivo (l);
	if (l <> nil) then
	begin 
		writeln ('  -- Lista en orden --  ');
		imprimirEnOrdenRec (l);
		writeln ('  -- Lista en orden inverso --  ');
		imprimirInversoRec (l);
		minimo := 9999;
		valorMinimoRecursivo (l, minimo);
		writeln ('El valor minimo de la lista es ', minimo);
		write ('Ingresar valor a buscar: ');
		readln (valor);
		encontre := false;
		buscarValorRecursivo (l, valor, encontre);
		if (encontre) then
			writeln ('El valor esta en la lista')
		else
			writeln ('El valor no se encontro en la lista');
	end;
	writeln ('Fin');
end.
