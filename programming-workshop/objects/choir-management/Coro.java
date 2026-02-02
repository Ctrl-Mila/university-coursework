package Tema5;


public abstract class Coro {
    
    private String nombre;
    private Director director;
    
    public Coro (String nombre, Director d) {
        setNombre(nombre);
        setDirector(d);
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public String getNombre() {
        return nombre;
    }

    public Director getDirector() {
        return director;
    }
    
    public abstract void agregarCorista (Corista c);
    
    public abstract boolean estaLleno ();
    
    public abstract boolean estaBienFormado ();
    
    @Override
    
    public String toString () {
        String aux = getNombre() + "\n" + "Director: " 
                + getDirector().toString() + "\n";
        return aux;
    }
    
}
