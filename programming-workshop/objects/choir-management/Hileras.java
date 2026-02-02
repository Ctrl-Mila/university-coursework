package Tema5;


public class Hileras extends Coro {
    
    private Corista [][] coroHilera;
    private int cantf;
    private int cantc;
    private int i = 0;
    private int j = 0;
    // private int cantCoristas = 0;

    public Hileras(String nombre, Director d, int cantf, int cantc) {
        super(nombre, d);
        this.cantf = cantf;
        this.cantc = cantc;
        coroHilera = new Corista [cantf][cantc];
    }
    
    public void agregarCorista (Corista c) { 
        if (j < cantc) {
            coroHilera[i][j] = c;
            j++;
        }
        else {
            i++;
            if (i < cantf) {
                j = 0;
                coroHilera[i][j] = c;
                j++;
            }
        }
    }
    
    /*
    public void agregarCorista (Corista c) {
            int fila = cantCoristas / cantc;
            int columna = cantCoristas % cantc;
            coroHilera[fila][columna] = c;
            cantCoristas++;
    }
    */
    
    public boolean estaLleno () {
        return ((i == cantf-1) && (j == cantc)); 
    }
    
    /*
    public boolean estaLleno () {
        return (cantCoristas == (cantc * cantf));
    }
    */
    
    public boolean estaBienFormado () {
        int ind1 = 0, ind2;
        boolean bienFormado = true;
        while ((ind1 < cantf) && (bienFormado)) {
            ind2 = 1;
            while ((ind2 < cantc) && (bienFormado)) {
                if (coroHilera[ind1][ind2].getTonoFund() != coroHilera[ind1][ind2-1].getTonoFund())
                    bienFormado = false;
                ind2++;
            }
            ind1++;
        }
        if (bienFormado){
            ind1 = 1;
            while ((ind1 < cantf) && (bienFormado)) {
                if (coroHilera[ind1][0].getTonoFund() > coroHilera[ind1-1][0].getTonoFund())
                    bienFormado = false;
                ind1++;
            }
        }
        return bienFormado;
    }

    @Override
    
    public String toString() {
        String aux = super.toString(); 
        for (int ind1 = 0; ind1 < i; ind1++) {
            for (int ind2 = 0; ind2 < cantc; ind2++)
                aux += "| " + coroHilera[ind1][ind2].toString() + " | ";
        }
        for (int ind = 0; ind < j; ind++)
            aux += "| " + coroHilera[i][ind].toString() + " | ";
        return aux;        
    }
    
    /*
    public String toString () {
        String aux = super.toString();
        int i = 0, j = 0;
        while (i < cantf) && (coroHilera[i][j] != null){
            while (j < cantc) && (coroHilera[i][j] != null) {
                aux += "| " + coroHilera[i][j].toString() + " | ";
                j++;
            }
            if (j == cantc) {
                j = 0;
                i++;
            }
        }
        return aux;
    }
    */
    
}
