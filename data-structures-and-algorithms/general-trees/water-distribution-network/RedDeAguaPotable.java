/*
 * Se modela una red de agua potable como un árbol general.
 * El caudal se divide en partes iguales en cada bifurcación.
 * El objetivo es calcular el caudal mínimo que recibe una casa.
 */

package tp3.ejercicio6;

import tp3.ejercicio1.GeneralTree;
import java.util.*;

public class RedDeAguaPotable {
	
	private GeneralTree<Character> red;
	
	public RedDeAguaPotable (GeneralTree<Character> a) {
		this.red = a;
	}
	
	public double minimoCaudal (double caudal) {
		
		if ((this.red != null) && (!this.red.isEmpty()))
			return minimo(red, caudal);
		return 9999.99;
	}
	
	private double minimo (GeneralTree<Character> r, double caudal) {
		
		if (r.isLeaf())
			return caudal;
		else {
			List<GeneralTree<Character>> hijos = r.getChildren();
			double valorHijos = caudal / hijos.size();
			double min = valorHijos, c;
			for (GeneralTree<Character> hijo : hijos) {
				c = minimo (hijo, valorHijos);
				if (c < min)
					min = c;
			}
			return min;
		}
	}
	
}
