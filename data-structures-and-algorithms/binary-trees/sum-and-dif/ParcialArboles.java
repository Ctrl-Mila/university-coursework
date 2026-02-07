/*
 * Ejercicio: Sum and Difference Tree
 *
 * Se recibe un árbol binario de enteros y se construye un nuevo árbol binario
 * con la misma estructura, donde cada nodo contiene:
 *  - La suma de los valores desde la raíz hasta dicho nodo.
 *  - La diferencia entre el valor del nodo actual y el valor de su nodo padre.
 *
 * En el caso de la raíz, se considera que el valor del nodo padre es 0.
 *
 * La solución se implementa de forma recursiva, propagando la información
 * necesaria a lo largo del recorrido del árbol.
 */

package tp2.ejercicio9;

import tp2.ejercicio1.BinaryTree;
import tp1.ejercicio8.Queue;

public class ParcialArboles {

	
	public BinaryTree <Dato> sumAndDif (BinaryTree <Integer> arbol) {
		
		if (arbol.isEmpty())
			return null;
		return nuevoArbol (arbol, 0, 0);
	}
	
	private BinaryTree<Dato> nuevoArbol (BinaryTree<Integer> a, int suma, int padre) {
		
		suma += a.getData();
		int diferencia = a.getData() - padre;
		
		BinaryTree<Dato> raiz = new BinaryTree<Dato> (new Dato (suma, diferencia));
		
		if (a.hasLeftChild())
			raiz.addLeftChild(nuevoArbol (a.getLeftChild(), suma, a.getData()));
		
		if (a.hasRightChild())
			raiz.addRightChild(nuevoArbol (a.getRightChild(), suma, a.getData()));
		
		return raiz;
				
	}
	
	//método solo para la prueba de imprimirlo y verlo
	
	public void entreNiveles(BinaryTree<Dato> d){
		
		Queue<BinaryTree<Dato>> cola = new Queue<>();
		BinaryTree<Dato> arbol;
		
		cola.enqueue(d);
		
		while (!cola.isEmpty()) {
			
			arbol = cola.dequeue();
			
				System.out.print(arbol.getData().toString() + " | ");
				
				if (arbol.hasLeftChild())
					cola.enqueue(arbol.getLeftChild());
				if (arbol.hasRightChild())
					cola.enqueue(arbol.getRightChild());
		}
	}
   
}
