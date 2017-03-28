package tallerweb.sangucheto.controladores;

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
		Stock.getInstance().agregarIngrediente(mostaza);
		model.put("IngredientesSangucheto",Sanguchetto.getInstance().verIngredientes());
		model.put("IngredientesEnStock", Stock.getInstance().listarIngredientesDisponibles());
		model.put("ingrediente", new Ingrediente());
		model.put("precioSanguche", Sanguchetto.getInstance().getPrecio());
		return new ModelAndView("home",model);
	}
	
	@RequestMapping(path="/agregar", method=RequestMethod.POST)
	public String agregarAlSangucheto(@ModelAttribute("ingrediente")Ingrediente ingrediente) {
		System.out.println(ingrediente);
		Sanguchetto.getInstance().agregarIngrediente(ingrediente);
		return "redirect:/";
	}
}
