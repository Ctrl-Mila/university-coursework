package Tema5;


public class Semicircular extends Coro{
    
    private Corista [] coroSemi;
    private int cantCoristas = 0;
    private int dimF;

    public Semicircular(String nombre, Director d, int cant) {
        super(nombre, d);
        dimF = cant;
        coroSemi = new Corista [cant];
    }
    
    public void agregarCorista (Corista c) {
        if (!this.estaLleno()) {
            coroSemi[cantCoristas] = c;
            cantCoristas++;
        }
    }
    
    public boolean estaLleno () {
        return (cantCoristas == dimF);
    }
    
    public boolean estaBienFormado () {
        int i = 1;
        while ((i < dimF) && (coroSemi[i-1].getTonoFund() >= coroSemi[i].getTonoFund()))
            i++;
        if (i == dimF)
            return true;
        else
            return false;
    }

    @Override
    
    public String toString() {
        String aux = super.toString();
        for (int i = 0; i < cantCoristas; i++)
            aux += " | " + coroSemi[i].toString() + " |" + "\n";
        return aux;
    }
    
}
