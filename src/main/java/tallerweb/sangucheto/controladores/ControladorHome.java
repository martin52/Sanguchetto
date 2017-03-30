package tallerweb.sangucheto.controladores;

import java.util.HashMap;
import java.util.Map;

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
		model.put("IngredientesSangucheto",Sanguchetto.getInstance().verIngredientesYCantidad());
		model.put("IngredientesEnStock", Stock.getInstance().listarIngredientesDisponibles());
		model.put("ingrediente", new Ingrediente());
		model.put("precioSanguche", Sanguchetto.getInstance().getPrecio());
		return new ModelAndView("home",model);
	}
	
	@RequestMapping(path="/agregar", method=RequestMethod.POST)
	public String agregarAlSangucheto(@ModelAttribute("ingrediente")Ingrediente ingrediente) {
		Sanguchetto.getInstance().agregarIngrediente(ingrediente);
		Stock.getInstance().comprarIngrediente(ingrediente, 1);
		return "redirect:/";
	}
	
	@RequestMapping(path="/cancelarSanguche", method=RequestMethod.POST)
	public String cancelarSanguche() {
		for (Ingrediente ingredienteSanguche : Sanguchetto.getInstance().verIngredientesYCondimentos()) {
			Stock.getInstance().agregarStock(ingredienteSanguche, 1);
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
	
	@RequestMapping(path="/stock")
	public ModelAndView stock() {
		ModelMap model = new ModelMap();
		Map<Ingrediente,Integer> stock = new HashMap<Ingrediente, Integer>();
		stock=Stock.getInstance().obtenerStock();
		model.put("stockActual", stock);
		model.put("ingredienteVacio", new Ingrediente());
	
		return new ModelAndView("stock",model);
	}
}
