package tp5.ejercicio3;

import tp5.ejercicio1.*;
import java.util.*;

public class Mapa {
		
	private Graph<String> mapaCiudades;
	
	public Mapa (Graph<String> grafo) {
		this.mapaCiudades = grafo;
	}
	
	public List<String> devolverCamino (String ciudad1, String ciudad2)  {
		
		List<String> camino = new ArrayList<>();
		Vertex<String> c1 = this.mapaCiudades.search(ciudad1);
		Vertex<String> c2 = this.mapaCiudades.search(ciudad2);
		if ((!this.mapaCiudades.isEmpty()) && (c1 != null) && (c2 != null)) {
			boolean [] visitado = new boolean [this.mapaCiudades.getSize()];
			int inicio = c1.getPosition();
			c1ac2 (inicio, camino, visitado, ciudad2);
		}
			
		return camino;
		
	}
	
	private boolean c1ac2 (int i, List<String> camino, boolean [] visitado, String ciudad2) {
		
		Vertex<String> v = this.mapaCiudades.getVertex(i);
		camino.add(v.getData());
		visitado[i]= true;
		
		if (v.getData().equals(ciudad2))
			return true;
		
		Iterator<Edge<String>> it = this.mapaCiudades.getEdges(v).iterator();
		boolean termine = false;
		while ((it.hasNext()) && (!termine)) {
			int sig = it.next().getTarget().getPosition();
			if (!visitado[sig])
				termine = c1ac2(sig, camino, visitado, ciudad2);
		}
		
		if (!termine)
			camino.remove(camino.size()-1);
		
		return termine;
		
	}
	
	
	public List<String> devolverCaminoExceptuando (String ciudad1, String ciudad2, List<String> ciudades) {
		
		List<String> camino = new ArrayList<>();
		Vertex<String> c1 = this.mapaCiudades.search(ciudad1);
		Vertex<String> c2 = this.mapaCiudades.search(ciudad2);
		if ((!this.mapaCiudades.isEmpty())&&(c1 != null)&&(c2 != null)) {
			if ((!ciudades.contains(ciudad1))&&(!ciudades.contains(ciudad2))) {
				boolean [] visitado = new boolean [this.mapaCiudades.getSize()];
				int inicio = c1.getPosition();
				caminoExcepto(inicio, visitado, ciudad2, ciudades, camino);
			}
		}
		
		return camino;
		
	}
	
	private boolean caminoExcepto (int inicio, boolean[] visitado, String ciudad2, List<String> ciudades, List<String> camino) {
		
		Vertex<String> v = this.mapaCiudades.getVertex(inicio);
		visitado [inicio] = true;
		
		boolean termine = false;
		
		if (!ciudades.contains(v.getData())) {
			
			camino.add(v.getData());
			if (v.getData().equals(ciudad2))
				return true;
			
			Iterator<Edge<String>> it = this.mapaCiudades.getEdges(v).iterator();
			while ((it.hasNext()) && (!termine)) {
				int sig = it.next().getTarget().getPosition();
				if (!visitado[sig])
					termine = caminoExcepto (sig, visitado, ciudad2, ciudades, camino);
			}
			
			if (!termine)
				camino.remove(camino.size()-1);
			
		}
		
		return termine;
		
	}
	
	
	public List<String> caminoMasCorto (String ciudad1, String ciudad2) {
		
		List<String> camino = new ArrayList<>();
		Vertex<String> c1 = this.mapaCiudades.search(ciudad1);
		Vertex<String> c2 = this.mapaCiudades.search(ciudad2);
		if ((!this.mapaCiudades.isEmpty())&&(c1 != null)&&(c2 != null)) {
			boolean [] visitado = new boolean [this.mapaCiudades.getSize()];
			int i = c1.getPosition();
			caminoCorto (i, ciudad2, camino, visitado, new ArrayList<String>(), 9999, 0);
		}
		
		return camino;
		
	}
	
	private int caminoCorto (int i, String ciudad2, List<String> camino, boolean[] visitado, List<String> caminoActual, int minimo, int actual) {
		
		Vertex<String> v = this.mapaCiudades.getVertex(i);
		caminoActual.add(v.getData());
		visitado[i] = true;
		
		if (v.getData().equals(ciudad2)) {
			if (actual < minimo) {
				minimo = actual;
				camino.clear();
				camino.addAll(caminoActual);
			}
		}
		else {
			for (Edge<String> arista : this.mapaCiudades.getEdges(v)) {
				int sig = arista.getTarget().getPosition();
				if (!visitado[sig])
					minimo = caminoCorto (sig, ciudad2, camino, visitado, caminoActual, minimo, actual+arista.getWeight());
			}
		}
		caminoActual.remove(caminoActual.size()-1);
		visitado[i] = false;
		return minimo;
		
	}
	
	
	public List<String> caminoSinCargarCombustible (String ciudad1, String ciudad2, int tanqueAuto) {
		
		List<String> camino = new ArrayList<>();
		Vertex<String> c1 = this.mapaCiudades.search(ciudad1);
		Vertex<String> c2 = this.mapaCiudades.search(ciudad2);
		
		if ((!this.mapaCiudades.isEmpty())&&(c1 != null)&&(c2 != null)) {
			boolean [] visitado = new boolean [this.mapaCiudades.getSize()];
			int inicio = c1.getPosition();
			sinCarga (inicio, visitado, camino, ciudad2, tanqueAuto);
		}
		
		return camino;
		
	}
	
	private boolean sinCarga (int inicio, boolean[] visitado, List<String> camino, String ciudad2, int tanqueAuto) {
		
		Vertex<String> v = this.mapaCiudades.getVertex(inicio);
		camino.add(v.getData());
		visitado[inicio] = true;
		
		if (v.getData().equals(ciudad2)) 
			return true;
		
		boolean termine = false;
		Iterator<Edge<String>> it = this.mapaCiudades.getEdges(v).iterator();
		while ((it.hasNext()) && (!termine)) {
			Edge<String> arista = it.next();
			int sig = arista.getTarget().getPosition();
			int peso = arista.getWeight();
			if ((!visitado[sig]) && (peso <= tanqueAuto))
				termine = sinCarga (sig, visitado, camino, ciudad2, tanqueAuto - peso); 
		}
		
		if (!termine) {
			camino.remove(camino.size()-1);
			visitado[inicio] = false;
		}
		
		return termine;
		
	}
	
	
	public List<String> caminoConMenorCargaDeCombustible (String ciudad1, String ciudad2, int tanqueAuto){
		
		List<String> camino = new ArrayList<>();
		Vertex<String> c1 = this.mapaCiudades.search(ciudad1);
		Vertex<String> c2 = this.mapaCiudades.search(ciudad2);
		
		if ((!this.mapaCiudades.isEmpty())&&(c1 != null)&&(c2 != null)) {
			boolean [] visitado = new boolean [this.mapaCiudades.getSize()];
			int inicio = c1.getPosition();
			menorCarga (inicio, visitado, ciudad2, tanqueAuto, tanqueAuto, camino, new ArrayList<>(), 9999, 0);
		}
		
		return camino;
		
	}
	
	private int menorCarga (int inicio, boolean[] visitado, String ciudad2, int tanque, int recarga, List<String> camino, List<String> caminoActual, int minimo, int cantCargas) {
		
		Vertex<String> v = this.mapaCiudades.getVertex(inicio);
		caminoActual.add(v.getData());
		visitado[inicio] = true;
		
		if (v.getData().equals(ciudad2)) {
			if (cantCargas < minimo) {
				minimo = cantCargas;
				camino.clear();
				camino.addAll(caminoActual);
			}
		}
		else {
			for (Edge<String> arista : this.mapaCiudades.getEdges(v)) {
				int i = arista.getTarget().getPosition();
				int peso = arista.getWeight();
				if (!visitado[i]) {
					if (peso <= tanque) {
						minimo = menorCarga (i, visitado, ciudad2, tanque-peso, recarga, camino, caminoActual, minimo, cantCargas);
					}
					else {
						if (recarga >= peso) 
							minimo = menorCarga (i, visitado, ciudad2, recarga-peso, recarga, camino, caminoActual, minimo, cantCargas+1);
					}
				}
			}
			
			
		}
		
		caminoActual.remove(caminoActual.size()-1);
		visitado[inicio] = false;
		return minimo;
		
	}
	
}
