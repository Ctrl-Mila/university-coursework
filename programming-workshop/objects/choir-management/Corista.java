package Tema5;


public class Corista extends Persona {
    
    private int tonoFund;

    public Corista(int tonoFund, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        setTonoFund(tonoFund);
    }

    public void setTonoFund(int tonoFund) {
        this.tonoFund = tonoFund;
    }

    public int getTonoFund() {
        return tonoFund;
    }
    
    @Override
    
    public String toString () {
        String aux = super.toString();
        aux += "Corista, tono fundamental: " + getTonoFund() + ". \n";
        return aux;
    }
}
