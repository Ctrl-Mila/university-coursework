package Tema5;


public class Gira extends Recital {
    
    private String nombre;
    private Fecha [] fechas;
    private Fecha fechaActual;
    private int cantFechas = 0;

    public Gira (String nombre, int cantTemas, String nom, int cantFechas) {
        super(nombre, cantTemas);
        setNombre(nom);
        fechas = new Fecha [cantFechas];
    }
    
    public String getNombre() {
        return nombre;
    }

    public Fecha getFechaActual() {
        return fechaActual;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setFechaActual(int i) {
        fechaActual = fechas[i];
    }
    
    public void agregarFecha (Fecha f) {
        fechas[cantFechas] = f;
        cantFechas++;
    }
    
    public void actuar () {
        for (int i = 0; i < cantFechas; i++) {
            setFechaActual(i);
            System.out.println ();
            System.out.println ("Buenas noches " 
                + this.fechaActual.getCiudad());
            System.out.println ();
            super.actuar();
        }
    }
    
    public double calcularCosto () {
        return (30000 * cantFechas);
    }
    
}
