/*
 * Un árbol general es de selección si cada nodo
 * contiene el menor valor entre todos sus hijos.
 * El método verifica si el árbol cumple esta propiedad.
 */

package tp3.ejercicio9;

import tp3.ejercicio1.GeneralTree;
import java.util.*;

public class ParcialArboles {

	
	public static boolean esDeSeleccion (GeneralTree<Integer> arbol) {
		
		if ((arbol != null) && (!arbol.isEmpty()))
			return seleccion(arbol);
		return false;
		
	}
	
	private static boolean seleccion (GeneralTree<Integer> a) {
	
		if (a.hasChildren()) {
			List<GeneralTree<Integer>> lista = a.getChildren();
			int min = Integer.MAX_VALUE;
			for (GeneralTree<Integer> hijo : lista) { 
				if (hijo.getData() < min)
					min = hijo.getData();
				if (!esDeSeleccion(hijo))
					return false;
			}
			if (min != a.getData())
				return false;
				
		}
		return true;
	}
	
	public static void main (String[] args) {
		
		GeneralTree<Integer> arbol = new GeneralTree<Integer> (12);
		
		GeneralTree<Integer> tt = new GeneralTree<Integer> (33);
		tt.addChild(new GeneralTree<Integer> (35));
		tt.addChild(new GeneralTree<Integer>(83));
		tt.addChild(new GeneralTree<Integer>(90));
		tt.addChild(new GeneralTree<Integer>(33));
		
		GeneralTree<Integer> doce = new GeneralTree<Integer>(12);
		doce.addChild(new GeneralTree<Integer>(14));
		doce.addChild(new GeneralTree<Integer>(12));
		doce.addChild(tt);

		GeneralTree<Integer> tcinco = new GeneralTree<Integer>(35);
		tcinco.addChild(new GeneralTree<Integer>(35));
		tcinco.getChildren().get(0).addChild(new GeneralTree<Integer>(35));
		
		GeneralTree<Integer> d = new GeneralTree<Integer>(12);
		d.addChild(tcinco);
		d.addChild(doce);
		
		GeneralTree<Integer> vcinco = new GeneralTree<Integer> (25);
		vcinco.addChild(new GeneralTree<Integer> (25));
		
		arbol.addChild(d);
		arbol.addChild(vcinco);
		
		if (esDeSeleccion(arbol))
			System.out.println ("El árbol es de Selección");
		else
			System.out.println ("El árbol no es de Selección");
		
	}
	
}
