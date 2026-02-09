package tp5.ejercicio2;

import java.util.*;
import tp5.ejercicio1.*;
import tp1.ejercicio8.Queue;

public class Recorridos {
	
	public <T> List<T> dfs(Graph<T> grafo) {
		
		List<T> resultado = new ArrayList<>();
		boolean [] visitado = new boolean [grafo.getSize()];
		
		for (int i=0; i<grafo.getSize(); i++) {
			if (!visitado[i])
				dfsRec(i, grafo, visitado, resultado);
		}
		
		return resultado;
		
	}
	
	private <T> void dfsRec(int i, Graph<T> grafo, boolean[] visitado, List<T> resultado) {
		
		Vertex<T> v = grafo.getVertex(i);
		visitado[i] = true;
		resultado.add(v.getData());
		
		for (Edge<T> arista : grafo.getEdges(v)) {
			int j = arista.getTarget().getPosition();
			if (!visitado[j])
				dfsRec(j, grafo, visitado, resultado);
		}
		
	}
	
	
	public <T> List<T> bfs(Graph<T> grafo) {
		
		List<T> resultado = new ArrayList<>();
		boolean [] visitado = new boolean [grafo.getSize()];
		
		for (int i=0; i<grafo.getSize(); i++) {
			if (!visitado[i])
				bfsQueue(i, grafo, visitado, resultado);
		}
		
		return resultado;
		
	}
	
	private <T> void bfsQueue(int i, Graph<T> grafo, boolean[] visitado, List<T> resultado) {
		
		Vertex<T> v = grafo.getVertex(i);
		Queue<Vertex<T>> cola = new Queue<>();
		cola.enqueue(v);
		int pos = v.getPosition();
		visitado[pos] = true;
		
		while (!cola.isEmpty()) {
			
			v = cola.dequeue();
			resultado.add(v.getData());
			
			for (Edge<T> aristas : grafo.getEdges(v)) {
				v = aristas.getTarget();
				pos = v.getPosition();
				if (!visitado[pos]) {
					cola.enqueue(v);
					visitado[pos] = true;
				}	
			}
			
		}
		
	}
	
}
