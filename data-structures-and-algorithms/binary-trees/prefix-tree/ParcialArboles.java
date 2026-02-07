/*
 * Ejercicio: Árbol Prefijo
 *
 * Se implementa un método que determina si un árbol binario es prefijo de otro.
 * Un árbol es prefijo de otro cuando coincide con la parte inicial del árbol
 * tanto en estructura como en el contenido de sus nodos.
 *
 * La solución se basa en una comparación recursiva entre ambos árboles,
 * verificando la igualdad de los datos y la existencia de los hijos correspondientes.
 */

package tp2.ejercicio8;

import tp2.ejercicio1.BinaryTree;

public class ParcialArboles {
	
	public boolean esPrefijo (BinaryTree<Integer> arbol1, BinaryTree <Integer> arbol2) {
		
		if (!arbol1.getData().equals(arbol2.getData())) 
			return false;
			
		boolean prefijo = true;
			
		if (arbol1.hasLeftChild()) {
			if (!arbol2.hasLeftChild())
				return false;
			prefijo = esPrefijo (arbol1.getLeftChild(), arbol2.getLeftChild());
		}
		if (prefijo) {
			if (arbol1.hasRightChild()) {
				if (!arbol2.hasRightChild())
					return false;
				prefijo = esPrefijo (arbol1.getRightChild(), arbol2.getRightChild());
			}
		}
		return prefijo;
	}
	
	public boolean esPrefijoChatgpt (BinaryTree<Integer> arbol1, BinaryTree <Integer> arbol2) {
		
		if (!arbol1.getData().equals(arbol2.getData())) 
            return false;
		else {
			if (arbol1.hasLeftChild()) {
				if (!arbol2.hasLeftChild()) 
					return false;
				if (!esPrefijo(arbol1.getLeftChild(), arbol2.getLeftChild())) 
					return false;   
			}
			
			if (arbol1.hasRightChild()) {
				if (!arbol2.hasRightChild()) 
					return false;
				if (!esPrefijo(arbol1.getRightChild(), arbol2.getRightChild())) 
					return false;
			}
		}

        return true;
	}
	
}
