package tp2.ejercicio4;

import tp2.ejercicio2.BinaryTree;

public class prueba {

	public static void main(String[] args) {
		
		//raiz
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(1);
		
		//hojas
		BinaryTree<Integer> a1 = new BinaryTree<Integer>(1);
		BinaryTree<Integer> a2 = new BinaryTree<Integer>(5);
		BinaryTree<Integer> a3 = new BinaryTree<Integer>(4);
		BinaryTree<Integer> a4 = new BinaryTree<Integer>(10);
		BinaryTree<Integer> a5 = new BinaryTree<Integer>(1);
		BinaryTree<Integer> a6 = new BinaryTree<Integer>(2);
		BinaryTree<Integer> a7 = new BinaryTree<Integer>(4);
		BinaryTree<Integer> a8 = new BinaryTree<Integer>(3);
		
		//asigno hijos
		BinaryTree<Integer> a9 = new BinaryTree<Integer>(10);
		a9.addLeftChild(a1);
		a9.addRightChild(a2);
		BinaryTree<Integer> a10 = new BinaryTree<Integer>(8);
		a10.addLeftChild(a3);
		a10.addRightChild(a4);
		BinaryTree<Integer> a11 = new BinaryTree<Integer>(3);
		a11.addLeftChild(a5);
		a11.addRightChild(a6);
		BinaryTree<Integer> a12 = new BinaryTree<Integer>(5);
		a12.addLeftChild(a7);
		a12.addRightChild(a8);
		
		BinaryTree<Integer> a13 = new BinaryTree<Integer>(2);
		a13.addLeftChild(a9);
		a13.addRightChild(a10);
		BinaryTree<Integer> a14 = new BinaryTree<Integer>(4);
		a14.addLeftChild(a11);
		a14.addRightChild(a12);
		
		arbol.addLeftChild(a13);
		arbol.addRightChild(a14);
		
		//prueba de metodo
		RedBinariaLlena red = new RedBinariaLlena (arbol);
		int maxRetardo = red.retardoReenvio();
		
		System.out.println ("El mayor retardo de reenvio es " + maxRetardo);

	}

}
