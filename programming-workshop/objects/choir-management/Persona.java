package Tema5;

public class Persona {
    
    private String nombre;
    private int dni;
    private int edad;

    public Persona(String nombre, int dni, int edad) {
        setNombre(nombre);
        setDni(dni);
        setEdad(edad);
    }

    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        String aux = "Nombre: " + getNombre() + 
                     ", DNI: " + getDni() + 
                     ", Edad: " + getEdad() + ". ";
        return aux;
    }
}
