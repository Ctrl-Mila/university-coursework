package Tema5;


public abstract class Recital {
    
    private String nomBanda;
    private String [] temas;
    private int cantTemas = 0;

    public Recital (String nom, int cantTemas) {
        setNomBanda(nom);
        temas = new String [cantTemas];
    }
    
    public String getNomBanda() {
        return nomBanda;
    }

    public void setNomBanda(String nomBanda) {
        this.nomBanda = nomBanda;
    }
    
    public void agregarTema (String tema) {
        temas[cantTemas] = tema;
        cantTemas++;
    }
    
    public void actuar () {
        for (int i = 0; i < cantTemas; i++)
            System.out.println ("Y ahora tocaremos '"
            + temas[i] + "'\n");
    }
    
    public abstract double calcularCosto (); 
    
}
