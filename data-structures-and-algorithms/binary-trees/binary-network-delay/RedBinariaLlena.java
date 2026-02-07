/*
 * Ejercicio: Red Binaria Llena
 *
 * Se modela una red binaria llena donde cada nodo representa un retardo
 * de reenvío expresado en segundos.
 *
 * El objetivo es calcular el mayor retardo posible en un camino desde
 * la raíz hasta una hoja.
 *
 * La solución se implementa mediante un recorrido recursivo que acumula
 * los retardos y selecciona el máximo entre los caminos disponibles.
 */

package tp2.ejercicio4;

import tp2.ejercicio2.BinaryTree;

public class RedBinariaLlena {
	
	private BinaryTree<Integer> ab;
	
	
	public RedBinariaLlena (BinaryTree<Integer> a) {
		this.ab = a;
	}
	
	public int retardoReenvio () {
		
		return calculoMaximoRetardo (this.ab);
		
	}
	
	public int calculoMaximoRetardo (BinaryTree<Integer> a) {
		
		Integer miDato = a.getData();
		
		if (a.isLeaf())
			return miDato;
		
		int contadorIzq = miDato + calculoMaximoRetardo(a.getLeftChild());
		int contadorDer = miDato + calculoMaximoRetardo(a.getRightChild());
		
		return (Math.max(contadorIzq, contadorDer));
	}
	
}
