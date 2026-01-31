package Tema5;


public class Fecha {
    
    private String ciudad;
    private int dia;

    public Fecha(String ciudad, int dia) {
        setCiudad(ciudad);
        setDia(dia);
    }
    
    public String getCiudad() {
        return ciudad;
    }

    public int getDia() {
        return dia;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
}
