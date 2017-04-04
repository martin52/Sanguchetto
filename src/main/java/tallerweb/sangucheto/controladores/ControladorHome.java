package tallerweb.sangucheto.controladores;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import tallerweb.sangucheto.modelo.BeanParaSelect;
import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.Stock;

@Controller
public class ControladorHome {

	@RequestMapping(path = "/")
	public ModelAndView irAHome() {
		ModelMap model = new ModelMap();
		model.put("IngredientesSangucheto", Sanguchetto.getInstance().verIngredientesYCantidad());
		model.put("IngredientesEnStock", Stock.getInstance().obtenerStock());
		model.put("ingrediente", new Ingrediente());
		model.put("precioSanguche", Sanguchetto.getInstance().getPrecio());
		return new ModelAndView("home", model);
	}

	@RequestMapping(path = "/agregar", method = RequestMethod.POST)
	public String agregarAlSangucheto(@ModelAttribute("ingrediente") Ingrediente ingrediente) {
		Sanguchetto.getInstance().agregarIngrediente(ingrediente);
		Stock.getInstance().comprarIngrediente(ingrediente, 1);
		return "redirect:/";
	}

	@RequestMapping(path = "/cancelarSanguche", method = RequestMethod.POST)
	public String cancelarSanguche() {
		for (Ingrediente ingredienteSanguche : Sanguchetto.getInstance().verIngredientesYCondimentos()) {
			Stock.getInstance().agregarStock(ingredienteSanguche, 1);
		}
		Sanguchetto.getInstance().vaciar();
		return "redirect:/";
	}

	@RequestMapping(path = "/confirmarSanguche", method = RequestMethod.POST)
	public ModelAndView confirmarSanguche() {
		ModelMap model = new ModelMap();
		model.put("sanguche", Sanguchetto.getInstance().verIngredientesYCantidad());
		model.put("precio", Sanguchetto.getInstance().getPrecio());
		return new ModelAndView("confirmar", model);
	}

	@RequestMapping(path = "/agregarMas", method = RequestMethod.POST)
	public String agregarMas() {
		return "redirect:/";
	}

	@RequestMapping(path = "/compra")
	public String compra() {
		Sanguchetto.getInstance().vaciar();
		return "redirect:/";
	}

	@RequestMapping(path = "/stock")
	public ModelAndView stock() {
		ModelMap model = new ModelMap();
		Map<Ingrediente, Integer> stock = new HashMap<Ingrediente, Integer>();
		stock = Stock.getInstance().obtenerStock();
		model.put("stockActual", stock);
		model.put("ingredienteYCantidad", new BeanParaSelect());
		model.put("ingredienteAgregado", new Ingrediente());
		return new ModelAndView("stock", model);
	}

	@RequestMapping(path = "/agregarStock", method = RequestMethod.POST)
	public String agregarStock(@ModelAttribute("ingredienteYCantidad") BeanParaSelect ingredienteyCantidad) {
		for (Ingrediente key : Stock.getInstance().obtenerStock().keySet()) {
			if (key.getNombre().equals(ingredienteyCantidad.getIngrediente())) {
				Stock.getInstance().agregarStock(key, ingredienteyCantidad.getCantidad());
			}
		}

		return "redirect:/stock";
	}

	@RequestMapping(path = "/agregarIngredienteAStock", method = RequestMethod.POST)
	public String agregarIngredienteAStock(@ModelAttribute("ingredienteAgregado") Ingrediente ingredienteAgregado,
			BindingResult result) {
//		if (ingredienteAgregado.getPrecio() < 0)
//			result.rejectValue("precio", "precNoVal");
//		if (result.hasErrors())
//			return "redirect:/stock";
		Stock.getInstance().agregarIngrediente(ingredienteAgregado);
		return "redirect:/stock";
	}
}
