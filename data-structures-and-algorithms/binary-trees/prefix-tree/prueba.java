package tp2.ejercicio8;

import tp2.ejercicio1.BinaryTree;

public class prueba {

	public static void main(String[] args) {


        // --- Árbol1 (el “prefijo”):
        //       65
        //      /  \
        //    37    81
        //      \     \
        //      47    93
        
		BinaryTree<Integer> tree1 = new BinaryTree<>(65);
        
		BinaryTree<Integer> t1_37 = new BinaryTree<>(37);
        
		BinaryTree<Integer> t1_81 = new BinaryTree<>(81);
        
		tree1.addLeftChild(t1_37);
        tree1.addRightChild(t1_81);
        
        t1_37.addRightChild(new BinaryTree<>(47));
        t1_81.addRightChild(new BinaryTree<>(93));
        
        // --- Árbol2 (árbol a compara, debería devolver true):
        //        65
        //       /  \
        //     37    81
        //    /  \  /  \
        //   22 47 76  93
        
        BinaryTree<Integer> tree2 = new BinaryTree<>(65);
        
        BinaryTree<Integer> t2_37 = new BinaryTree<>(37);
        
        BinaryTree<Integer> t2_81 = new BinaryTree<>(81);
        
        tree2.addLeftChild(t2_37);
        tree2.addRightChild(t2_81);
        
        t2_37.addLeftChild(new BinaryTree<>(22));
        t2_37.addRightChild(new BinaryTree<>(47));
        
        t2_81.addLeftChild(new BinaryTree<>(76));
        t2_81.addRightChild(new BinaryTree<>(93));
        
        ParcialArboles helper = new ParcialArboles();
        
        System.out.println("tree1 es prefijo de tree2? " + helper.esPrefijo(tree1, tree2)); // true

        System.out.println("tree1 es prefijo de tree1? " + helper.esPrefijo(tree1, tree1)); // true

	}

}
