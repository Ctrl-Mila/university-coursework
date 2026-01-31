package Tema5;


public class Evento extends Recital {
    
    private String motivo;
    private String nomContratante;
    private int dia;

    public Evento (String nombre, int cantTemas, String motivo, String nom, int dia) {
        super(nombre, cantTemas);
        setMotivo(motivo);
        setNomContratante(nom);
        setDia(dia);
    }
    
    public String getMotivo() {
        return motivo;
    }

    public String getNomContratante() {
        return nomContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public void setNomContratante(String nomContratante) {
        this.nomContratante = nomContratante;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    public void actuar () {
        if (this.getMotivo().equals("A beneficiencia")) {
            System.out.println ("Recuerden colaborar con "
                    + this.getNomContratante());
        }
        else {
            if (this.getMotivo().equals("Show de TV")) 
                System.out.println ("Saludos amigos televidentes");
            else
                System.out.println ("Un feliz cumpleaños para " + this.getNomContratante());
        }
        System.out.println ();
        super.actuar();
    }
    
    public double calcularCosto () {
        if (this.getMotivo().equals("A beneficio"))
            return 0;
        else {
            if (this.getMotivo().equals("Show de TV"))
                return 50000;
            else
                return 150000;
        }
            
    }
    
}
