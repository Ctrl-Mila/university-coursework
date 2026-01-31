package Tema5;


public class Auto {
    
    private String dueño;
    private String patente;

    public Auto (String dueño, String patente) {
        setDueño(dueño);
        setPatente(patente);
    }
    
    public String getDueño() {
        return dueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    
    public String toString() {
        return "Auto {" + "Dueño: " + dueño + ", patente " + patente + '}';
    }
    
}
