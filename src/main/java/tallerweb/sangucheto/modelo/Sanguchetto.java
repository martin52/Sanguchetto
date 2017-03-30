package tallerweb.sangucheto.modelo;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class Sanguchetto {

	private static Sanguchetto instance = new Sanguchetto();
	private List<Ingrediente> ingredientes = new LinkedList<Ingrediente>(); //borrable
	
	private HashMap<Ingrediente,Integer> ingredienteYCantidad = new HashMap<Ingrediente,Integer>(); 
	
	private Sanguchetto(){}
	
	public static Sanguchetto getInstance(){
		return instance;
	}
	
	/**
	 * Elimina todos los ingredientes del sanguchetto.<br>
	 */
	public void vaciar(){
		ingredientes.clear();
	}
	
	/**
	 * Agrega un ingrediente al carrito.<br>
	 * @param ingrediente
	 */
	public void agregarIngrediente(Ingrediente ingrediente){
		//if(!(ingredientes.contains(ingrediente))) // tirar exception por ingrediente existente
			ingredientes.add(ingrediente);
		if(ingredienteYCantidad.containsKey(ingrediente)) {
			Integer nuevaCantidad = ingredienteYCantidad.get(ingrediente)+1;
			ingredienteYCantidad.put(ingrediente, nuevaCantidad);
		}
		else {
			ingredienteYCantidad.put(ingrediente,1);
		}
	}
	
	/**
	 * Lista todos los ingredientes que forman parte del sanguchetto.<br>
	 * @return
	 */
	public List<Ingrediente> verIngredientes(){
		// Implementar
		List<Ingrediente> soloIngredientes = new LinkedList<Ingrediente>();
        for (Ingrediente ingrediente : ingredientes) {
        	if(ingrediente.getTipo().toString().toLowerCase() == "ingrediente")
				soloIngredientes.add(ingrediente);
		}
    	return soloIngredientes;
	}
	
	/**
     * Lista todos los condimentos que forman parte del sanguchetto.<br>
     * @return
     */
    public List<Ingrediente> verCondimentos(){
        // Implementar
    	List<Ingrediente> condimentos = new LinkedList<Ingrediente>();
        for (Ingrediente ingrediente : ingredientes) {
        	if(ingrediente.getTipo().toString().toLowerCase() == "condimento")
				condimentos.add(ingrediente);
		}
    	return condimentos;
    }
	
	/**
	 * Devuelve el precio total del sanguchetto.<br>
	 * @return
	 */
	public Double getPrecio(){
		// Implementar
		Double precio = 0.0;
		for (Ingrediente ingrediente : ingredienteYCantidad.keySet()) {
			precio += ingrediente.getPrecio()*ingredienteYCantidad.get(ingrediente);
		}
		return precio;
	}
	/////Agregados///
	/**
	 * Devuelve todos los condimentos e ingredientes que forman parte del Sanguchetto
	 */
	public List<Ingrediente> verIngredientesYCondimentos(){
		return ingredientes;
	}
	
	public HashMap<Ingrediente,Integer> verIngredientesYCantidad(){
		return ingredienteYCantidad;
	}

}
