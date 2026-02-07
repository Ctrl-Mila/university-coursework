/*
 * Dado un árbol general con valores 0 y 1,
 * se busca el camino con valor máximo calculado como
 * la suma de los valores multiplicados por su nivel.
 * Solo se agregan al camino los nodos con valor 1.
 */

package tp3.ejercicio10;

import tp3.ejercicio1.GeneralTree;
import java.util.*;

public class ParcialArboles {
	
	public static List<Integer> resolver (GeneralTree<Integer> arbol) {
		List<Integer> lista =new LinkedList<> ();
		if ((arbol != null) && (!arbol.isEmpty()))
			recursion (arbol, lista, new LinkedList<Integer>(), 0, Integer.MIN_VALUE, 0);
		return lista;
	}
	
	private static int recursion (GeneralTree<Integer> a, List<Integer> lista, List<Integer> caminoActual, int sumaValores, int maximo, int nivel) {
		
		Integer dato = a.getData();
		if (dato == 1) {
			caminoActual.add(dato);
			sumaValores += nivel;
		}
		if (a.isLeaf()) {
			if (sumaValores > maximo) {
				maximo = sumaValores;
				lista.clear();
				lista.addAll(caminoActual);
			}
		}
		else {
			List<GeneralTree<Integer>> hijos = a.getChildren();
			for (GeneralTree<Integer> hijo : hijos)
				maximo = recursion (hijo, lista, caminoActual, sumaValores, maximo, nivel+1);
		}
		if (dato == 1)
			caminoActual.remove(caminoActual.size()-1);
		return maximo;
	}
	
	public static void main (String [] args) {
		
		GeneralTree<Integer> arbol = new GeneralTree<Integer> (1);
		
		GeneralTree<Integer> a = new GeneralTree<Integer> (1);
		a.addChild(new GeneralTree<Integer>(1));
		a.addChild(new GeneralTree<Integer>(1));
		a.addChild(new GeneralTree<Integer>(1));
		
		GeneralTree<Integer> b = new GeneralTree<Integer>(0);
		b.addChild(a);
		b.addChild(new GeneralTree<Integer>(1));
		
		arbol.addChild(b);
		
		GeneralTree<Integer> c = new GeneralTree<Integer>(0);
		c.addChild(new GeneralTree<Integer>(1));
		GeneralTree<Integer> d = new GeneralTree<Integer>(0);
		d.addChild(c);

		GeneralTree<Integer> e = new GeneralTree<Integer>(1);
		e.addChild(new GeneralTree<Integer>(1));
		e.addChild(d);
		
		arbol.addChild(e);
		
		GeneralTree<Integer> f = new GeneralTree<Integer>(0);
		f.addChild(new GeneralTree<Integer>(0));
		f.addChild(new GeneralTree<Integer>(0));
		GeneralTree<Integer> g = new GeneralTree<Integer>(0);
		g.addChild(f);
		GeneralTree<Integer> h = new GeneralTree<Integer>(1);
		h.addChild(g);
		
		arbol.addChild(h);
		
		List<Integer> lista = resolver(arbol);
		System.out.println ("El camino filtrado de valor máximo es -> " + lista);
		
	}
	
}
