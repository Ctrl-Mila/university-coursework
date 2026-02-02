package Tema5;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {

    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Director d = new Director (6, "Gabriel Hernandez", 26354433, 46);
        Semicircular semi = new Semicircular ("Coro semicircular", d, 6);
        
        d = new Director (4, "Tomás Blanco", 34554456, 35);
        Hileras h = new Hileras ("Coro por hileras", d, 3, 4);
        
        Corista c;
        System.out.println ("Se ingresarán los coristas del coro Semicircular: ");
        System.out.println();
        for (int i = 0; i < 2; i++) {
            System.out.println ("Ingresar Tono Fundamental y nombre del corista: ");
            c = new Corista (Lector.leerInt(), Lector.leerString(), GeneradorAleatorio.generarInt(20000000) + 20000000, GeneradorAleatorio.generarInt(30) + 20);
            semi.agregarCorista(c);
        }
        System.out.println(); 
        System.out.println ("Se ingresarán los coristas del coro por hileras: ");
        System.out.println();
        for (int i = 0; i < 12; i++) {
            System.out.println ("Ingresar Tono Fundamental y nombre del corista: ");
            c = new Corista (Lector.leerInt(), Lector.leerString(), GeneradorAleatorio.generarInt(20000000) + 20000000, GeneradorAleatorio.generarInt(30) + 20);
            h.agregarCorista(c);
        }
        
        System.out.println ();
        System.out.println (semi.toString());
        System.out.println ();
        if (semi.estaLleno()) {
            if (semi.estaBienFormado())
                System.out.println ("El " + semi.getNombre() + " está bien formado.");
            else
                System.out.println ("El " + semi.getNombre() + " no está bien formado.");
        }
        else
            System.out.println ("El coro esta incompleto");
        
        
        System.out.println ();
        System.out.println (h.toString());
        System.out.println ();
        if (h.estaLleno()) {
            if (h.estaBienFormado())
                System.out.println ("El " + h.getNombre() + " está bien formado.");
            else
                System.out.println ("El " + h.getNombre() + " no está bien formado.");
        }
        else
            System.out.println ("El coro esta incompleto");
    }
    
}
