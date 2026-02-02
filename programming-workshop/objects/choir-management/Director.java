package Tema5;

public class Director extends Persona {
    
    private int antiguedad;

    public Director(int antiguedad, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        setAntiguedad(antiguedad);
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux += "Antigüedad: " + getAntiguedad() + " años.";
        return aux;
    }
}
