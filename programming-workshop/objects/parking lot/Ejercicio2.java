package Tema5;

import PaqueteLectura.Lector;

public class Ejercicio2 {

    
    public static void main(String[] args) {
        
        Estacionamiento e = new Estacionamiento ("Cars", "Santa fe 1560", "9:30", "21:30", 3, 3);
        Auto a1 = new Auto ("Camila de la Roza", "TYU345");
        Auto a2 = new Auto ("Santiago Logioco", "UIY567");
        Auto a3 = new Auto ("Sonia Rodriguez", "TSG563");
        Auto a4 = new Auto ("Sol Ormaechea", "UHJ237");
        Auto a5 = new Auto ("Juan Pablo Ranzatto", "HJW223");
        Auto a6 = new Auto ("Ignacio de la Roza", "ITM410");
        
        e.registrarAuto(a1, 2, 3);
        e.registrarAuto (a2, 1, 3);
        e.registrarAuto (a3, 2, 2);
        e.registrarAuto (a4, 2, 1);
        e.registrarAuto (a5, 3, 3);
        e.registrarAuto (a6, 3, 1);
        
        System.out.println (e.toString());
        System.out.println();
        System.out.println();
        System.out.println("La cantidad de autos ubicados en la plaza 1 "
                            + "(teniendo en cuenta todos los pisos) es "
                            + e.cantAutosEnPlaza(1));
        System.out.println();
        System.out.println();
        System.out.print("Ingresar una patente a buscar: ");
        String p = Lector.leerString();
        System.out.println();
        System.out.println(e.pisoYPlazaDelAuto(p));
        
    }
    
}
