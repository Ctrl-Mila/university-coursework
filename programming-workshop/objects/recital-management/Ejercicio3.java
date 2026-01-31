package Tema5;


public class Ejercicio3 {

    public static void main(String[] args) {
        
        Evento e = new Evento ("Metallica", 4, "Show de TV", "MTV", 24);
        e.agregarTema("Nothing Else Matters");
        e.agregarTema("Fuel");
        e.agregarTema("Hardwired");
        e.agregarTema("Master Of Puppets");
        
        Gira g = new Gira ("Depeche Mode", 5, "Depeche Tour", 3);
        g.agregarTema("Enjoy The Silence");
        g.agregarTema ("Just Can't Get Enough");
        g.agregarTema ("Precious");
        g.agregarTema ("Policy Of Truth");
        g.agregarTema ("Strangelove");
        Fecha f1 = new Fecha ("Atlanta", 23), f2 = new Fecha ("Nueva York", 25), f3 = new Fecha ("Ohio", 28);
        g.agregarFecha(f1);
        g.agregarFecha(f2);
        g.agregarFecha(f3);
        
        System.out.println ("El costo del evento de " 
                + e.getNomBanda() + " es de $" + e.calcularCosto());
        System.out.println ();
        System.out.println ("El costo de la gira de " 
                + g.getNomBanda() + " es de $" + g.calcularCosto());
        System.out.println ();
        System.out.println ("Actuación de " + e.getNomBanda() + ":");
        System.out.println ();
        e.actuar();
        System.out.println ("Actuación de " + g.getNomBanda() + ":");
        g.actuar();
        System.out.println ();
        
    }
    
}
