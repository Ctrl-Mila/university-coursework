{
Programming Workshop – Binary Search Trees

This exercise models a sales management system for a bookstore using
a Binary Search Tree (BST).

Each tree node represents a product identified by its product code.
For each product, the program accumulates:
- total units sold
- total revenue generated

Sales are processed incrementally, updating existing products or
inserting new nodes when necessary.

The program demonstrates:
- insertion and update operations in a BST
- in-order traversal to display sorted data
- recursive aggregation and conditional traversal
- range-based queries optimized using BST properties

This solution highlights efficient data organization and recursive
processing of hierarchical structures.
}

program Ejercicio3;

Type
	venta = record
		codVenta : integer;
		codProducto : integer;
		cantUni : integer;
		precioUni : real;
	end;
	producto = record
		codigo : integer;
		cantTotal : integer;
		montoTotal : real;
	end;
	arbol = ^nodo;
	nodo = record
		dato : producto;
		HI : arbol;
		HD : arbol;
	end;

{a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
 código de producto. De cada producto deben quedar almacenados su código, la
 cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
 venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. 
 El ingreso de las ventas finaliza cuando se lee el código de venta-1.}

procedure generarArbol (var a : arbol);

	procedure leerVenta (var v : venta);
	begin
		write ('Ingresar codigo de venta (-1 para finalizar): ');
		readln (v.codVenta);
		if (v.codVenta <> -1) then
		begin
			write ('Ingrese codigo del producto: ');
			v.codProducto := random(15) + 1;
			writeln (v.codProducto);
			write ('Ingrese cantidad de unidades vendidas: ');
			v.cantUni := random(50) + 1;
			writeln (v.cantUni);
			write ('Ingrese precio unitario: $');
			v.precioUni := (random(500) + 1)/3;
			writeln (v.precioUni:1:2);
		end;
	end;
	
	procedure crearProducto (var p : producto; v : venta);
	begin
		p.codigo := v.codProducto;
		p.cantTotal := v.cantUni;
		p.montoTotal := v.cantUni * v.precioUni;
	end;

	procedure agregarNodo (var a : arbol; p : producto);
	begin
		if (a = nil) then
		begin
			new(a);
			a^.dato := p;
			a^.HI :=nil;
			a^.HD := nil;
		end	
		else
		begin
			if (a^.dato.codigo = p.codigo) then
			begin
				a^.dato.cantTotal := a^.dato.cantTotal + p.cantTotal;
				a^.dato.montoTotal := a^.dato.montoTotal + p.montoTotal;
			end
			else
				if (p.codigo < a^.dato.codigo) then
					agregarNodo (a^.HI, p)
				else
					agregarNodo (a^.HD, p);
		end;
	end;

var 
	p : producto;
	v : venta;
begin
	randomize;
	a := nil;
	leerVenta (v);
	while (v.codVenta <> -1) do
	begin
		crearProducto (p, v);
		agregarNodo (a, p);
		leerVenta (v);
	end;
	writeln;
	writeln;
end;

{b. Imprimir el contenido del árbol ordenado por código de producto.}

procedure imprimirOrdenado (a : arbol);
begin
	if (a <> nil) then
	begin
		imprimirOrdenado (a^.HI);
		writeln ('Codigo ', a^.dato.codigo, ' - Cantidad total de unidades vendidas ', a^.dato.cantTotal, ' - Monto total  $', a^.dato.montoTotal:1:2);
		imprimirOrdenado (a^.HD);
	end;
end;

{c. Retornar el código de producto con mayor cantidad de unidades vendidas.}

procedure recorridoCantidadDeUnidades (a : arbol);

	procedure actMax (var cant : integer; var cod : integer; cantU : integer; codigo : integer);
	begin
		if (cantU > cant) then
		begin
			cant := cantU;
			cod := codigo;
		end;
	end;

	procedure conseguirCodigo (a : arbol; var cant : integer; var cod : integer);
	begin
		if (a <> nil) then
		begin
			actMax (cant, cod, a^.dato.cantTotal, a^.dato.codigo);
			conseguirCodigo (a^.HI, cant, cod);
			conseguirCodigo (a^.HD, cant, cod);
		end;
	end;

var	
	cant, cod : integer;
begin
	cant := 0;
	conseguirCodigo (a, cant, cod);
	writeln;
	writeln;
	writeln ('El codigo de producto con mayor cantidad de unidades vendidas es ', cod);
	writeln;
end;

{d. Retornar la cantidad de códigos que existen en el árbol que son menores que un 
valor que se recibe como parámetro.}

procedure codigosMenoresAValor (a : arbol);

	function cantidadMenores (a : arbol; valor : integer) : integer;
	begin
		if (a = nil) then
			cantidadMenores := 0
		else
		begin
			if (a^.dato.codigo < valor) then
				cantidadMenores := 1 + cantidadMenores (a^.HI, valor) + cantidadMenores (a^.HD, valor)
			else
				cantidadMenores := cantidadMenores (a^.HI, valor);
		end;
	end;

var
	valor : integer;
begin
	write ('Ingresar un valor para buscar cuantos codigos son menores a el: ');
	readln (valor);
	writeln;
	writeln;
	writeln ('La cantidad de codigos menores a ', valor, ' es ', cantidadMenores(a, valor));
	writeln;
	writeln; 
end;


{e. Retornar el monto total entre todos los códigos de productos comprendidos 
entre dos valores recibidos (sin incluir) como parámetros.}
 
procedure montoTotalCodigos (a : arbol);

	function montoTotal (a : arbol; valor1 : integer; valor2 : integer) : real;
	begin
		if (a = nil) then
			montoTotal := 0
		else
		begin
			if (a^.dato.codigo > valor1) and (a^.dato.codigo < valor2) then
				montoTotal := a^.dato.montoTotal + montoTotal (a^.HI, valor1, valor2) + montoTotal (a^.HD, valor1, valor2)
			else
			begin
				if (a^.dato.codigo < valor1) then
					montoTotal := montoTotal(a^.HD, valor1, valor2)
				else
					montoTotal := montoTotal (a^.HI, valor1, valor2);
			end;
		end;
	end; 
	
var
	valor1, valor2 : integer;
begin
	write ('Ingresar el primer valor (menor) para comparar con codigos: ');
	readln (valor1);
	write ('Ingresar el segundo valor (mayor) para comparar con codigos: ');
	readln (valor2);
	writeln;
	writeln;
	writeln ('El monto total entre todos los codigos de productos comprendidos entre ', valor1, ' y ', valor2, ' es ', montoTotal(a, valor1, valor2):1:2);
	writeln;
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
		imprimirOrdenado (a);
		recorridoCantidadDeUnidades (a);
		codigosMenoresAValor (a);
		montoTotalCodigos (a);
	end;
end.
