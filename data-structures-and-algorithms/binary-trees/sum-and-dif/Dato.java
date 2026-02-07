package tp2.ejercicio9;

public class Dato {

	private int suma;
	private int diferencia;
	
	public Dato (int s, int d) {
		this.suma = s;
		this.diferencia = d;
	}

	public int getSuma() {
		return suma;
	}

	public void setSuma(int suma) {
		this.suma = suma;
	}

	public int getDiferencia() {
		return diferencia;
	}

	public void setDiferencia(int diferencia) {
		this.diferencia = diferencia;
	}
	
	@Override
	
	public String toString () {
		return ("(" + getSuma() + ", " + getDiferencia() + ")");
	}
}
