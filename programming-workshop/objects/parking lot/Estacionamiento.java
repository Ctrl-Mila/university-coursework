package Tema5;


public class Estacionamiento {
    
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Auto [][] autos;
    private int numPiso = 5;
    private int numPlaza = 10;

    public Estacionamiento(String nombre, String direccion) {
        setNombre(nombre);
        setDireccion(direccion);
        setHoraApertura("8:00");
        setHoraCierre("21:00");
        autos = new Auto [numPiso][numPlaza];
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int numPisos, int numPlazas) {
        setNombre(nombre);
        setDireccion(direccion);
        setHoraApertura(horaApertura);
        setHoraCierre(horaCierre);
        autos = new Auto [numPisos][numPlazas];
        numPiso = numPisos;
        numPlaza = numPlazas;
    }
    
    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }
    
    public void registrarAuto(Auto a, int numPiso, int numPlaza) {
        autos[numPiso-1][numPlaza-1] = a;
    }
    
    public String pisoYPlazaDelAuto (String patente) {   
        String rta = "Auto Inexistente";
        int i = 0, j = 0;
        while (i < numPiso) {
            while (j < numPlaza) {
                if ((autos[i][j] != null) && (autos[i][j].getPatente().equals(patente))) {
                    rta = "El auto con patente " + patente 
                    + " se encuentra en el piso "
                    + (i+1) + ", plaza " + (j+1);
                    return rta;
                }
                j++;
            } 
            i++;
            j = 0;
        }
        return rta;
    }
    
    public int cantAutosEnPlaza (int numP) {
        int cant = 0, j;
        for (j = 0; j < numPiso; j++) {
            if (autos[j][numP-1] != null)
                cant++; 
        }
        return cant;
    }
    
    @Override
    
    public String toString() {
        String aux = "Estacionamiento:\n";
        for (int i = 0; i < numPiso; i++) {
            for (int j = 0; j < numPlaza; j++) {
                if (autos[i][j] != null)
                    aux += "Piso " + (i+1) + ", Plaza " + (j+1)
                        + " - " + autos[i][j].toString();
                else
                    aux += "Piso " + (i+1) + ", Plaza " + (j+1)
                        + " - Libre ";
                aux += "\n";
            }
                
        }
        return aux;
    }
    
}
