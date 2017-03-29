package tallerweb.sangucheto.controladores;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.Stock;
import tallerweb.sangucheto.modelo.TipoIngrediente;

@Controller
public class ControladorHome {

	@RequestMapping(path="/")
	public ModelAndView irAHome(){
		ModelMap model = new ModelMap();
		Ingrediente mayonesa = new Ingrediente();
		Ingrediente mostaza = new Ingrediente();
		mayonesa.setNombre("Mayonesa");
		mayonesa.setPrecio(15.22);
		mayonesa.setTipo(TipoIngrediente.INGREDIENTE);
		mostaza.setNombre("Mostaza");
		mostaza.setPrecio(20.75);
		mostaza.setTipo(TipoIngrediente.CONDIMENTO);
		Stock.getInstance().obtenerStock().clear();
		Stock.getInstance().agregarIngrediente(mayonesa);
		Stock.getInstance().agregarStock(mayonesa, 25);
		Stock.getInstance().agregarIngrediente(mostaza);
		Stock.getInstance().comprarIngrediente(mostaza, 33);
		
for (Ingrediente var : Sanguchetto.getInstance().verIngredientesYCondimentos()) {
	
	System.out.println(var.getNombre() + "  Cantidad: "+ Sanguchetto.getInstance().verIngredientesYCantidad().get(var.getNombre()));
}
System.out.println("lalalallala");	
		model.put("IngredientesSangucheto",Sanguchetto.getInstance().verIngredientesYCondimentos());
		model.put("IngredientesEnStock", Stock.getInstance().listarIngredientesDisponibles());
		model.put("ingrediente", new Ingrediente());
		model.put("precioSanguche", Sanguchetto.getInstance().getPrecio());
		return new ModelAndView("home",model);
	}
	
	@RequestMapping(path="/agregar", method=RequestMethod.POST)
	public String agregarAlSangucheto(@ModelAttribute("ingrediente")Ingrediente ingrediente) {
		
		Stock.getInstance().comprarIngrediente(ingrediente, 1);
		Sanguchetto.getInstance().agregarIngrediente(ingrediente);
		return "redirect:/";
	}
	
	@RequestMapping(path="/cancelarSanguche", method=RequestMethod.POST)
	public String cancelarSanguche() {
		List<Ingrediente> ingredientesSangucheto = new LinkedList<Ingrediente>();
		ingredientesSangucheto = Sanguchetto.getInstance().verIngredientesYCondimentos();
		for (String ingrediente : ingredientesSangucheto.keySet()) {
			Stock.getInstance().agregarStock(Stock.getInstance().obten, ingredientesSangucheto.get(ingrediente));
		}
		Sanguchetto.getInstance().vaciar();
		return "redirect:/";
	}
	
	@RequestMapping(path="/confirmarSanguche", method=RequestMethod.POST)
	public ModelAndView confirmarSanguche() {
		ModelMap model = new ModelMap();
		model.put("sanguche", Sanguchetto.getInstance().verIngredientesYCondimentos());
		model.put("precio", Sanguchetto.getInstance().getPrecio());
		return new ModelAndView("confirmar",model);
	}
	
	@RequestMapping(path="/agregarMas", method=RequestMethod.POST)
	public String agregarMas() {
		return "redirect:/";
	}
	
	@RequestMapping(path="/compra")
	public String compra() {
		Sanguchetto.getInstance().vaciar();
		return "redirect:/";
	}
	
	@RequestMapping(path="/stock", method=RequestMethod.GET)
	public ModelAndView stock() {
		ModelMap model = new ModelMap();
		model.put("stockActual", Stock.getInstance().obtenerStock());
		return new ModelAndView("stock",model);
	}
	
	@RequestMapping(path="/agregarStock")
	public String agregarStock() {
		
		return "redirect:/stock";
	}
}
