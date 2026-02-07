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
