package tp3.ejercicio6;

import tp3.ejercicio1.GeneralTree;

public class prueba {

	public static void main(String[] args) {
		
		GeneralTree<Character> red = new GeneralTree<> ('A');
		
		
		GeneralTree<Character> g = new GeneralTree<> ('G');
		g.addChild(new GeneralTree<Character> ('L'));
		GeneralTree<Character> j = new GeneralTree<> ('J');
		j.addChild(new GeneralTree<Character> ('M'));
		j.addChild(new GeneralTree<Character> ('N'));
		
		GeneralTree<Character> c = new GeneralTree<> ('C');
		c.addChild(new GeneralTree<Character> ('F'));
		c.addChild(g);
		
		GeneralTree<Character> d = new GeneralTree<> ('D');
		d.addChild(new GeneralTree<Character> ('H'));
		d.addChild(new GeneralTree<Character> ('I'));
		d.addChild(j);
		d.addChild(new GeneralTree<Character> ('K'));
		d.addChild(new GeneralTree<Character> ('P'));
		
		GeneralTree<Character> b = new GeneralTree<> ('B');
		GeneralTree<Character> e = new GeneralTree<> ('E');
		
		red.addChild(b);
		red.addChild(c);
		red.addChild(d);
		red.addChild(e);
		
		RedDeAguaPotable prueba = new RedDeAguaPotable (red);
		System.out.print ("El minimo caudal de la red es ");
		System.out.println (prueba.minimoCaudal(1000));

	}

}
