package tp2.ejercicio9;

import tp2.ejercicio1.BinaryTree;

public class prueba {

	public static void main(String[] args) {
		
		//          5
		//        /   \
		//       3     8
		//      / \
		//     1   4
		
		BinaryTree<Integer> original = new BinaryTree<>(5);
        original.addLeftChild(new BinaryTree<>(3));
        original.addRightChild(new BinaryTree<>(8));
        original.getLeftChild().addLeftChild(new BinaryTree<>(1));
        original.getLeftChild().addRightChild(new BinaryTree<>(4));

        ParcialArboles pa = new ParcialArboles();
        BinaryTree<Dato> nuevo = pa.sumAndDif(original);

        pa.entreNiveles(nuevo);

	}

}
