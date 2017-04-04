package tallerweb.sangucheto.controladores;

import java.text.DecimalFormat;
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
import tallerweb.sangucheto.modelo.Descuento;
import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.Stock;

@Controller
public class ControladorHome {

	@RequestMapping(path = "/")
	public ModelAndView irAHome() {
		ModelMap model = new ModelMap();
		DecimalFormat df = new DecimalFormat("0.00");
		model.put("IngredientesSangucheto", Sanguchetto.getInstance().verIngredientesYCantidad());
		model.put("IngredientesEnStock", Stock.getInstance().obtenerStock());
		model.put("ingrediente", new Ingrediente());
		model.put("ingredienteASacar", new Ingrediente());
		model.put("descuento", Descuento.correspondeDescuento(Sanguchetto.getInstance().getPrecio()));
		model.put("precioSangucheFinal", df.format(Descuento.aplicarASanguchetto(Sanguchetto.getInstance().getPrecio())).toString());
		model.put("precioSangucheSinDescuento", df.format(Sanguchetto.getInstance().getPrecio()).toString());
		model.put("porcentajeDeDescuento", df.format(Descuento.getPorcentajeDeDescuento()).toString());
		model.put("cantidadDeIngredientes",Sanguchetto.getInstance().verIngredientes().size());
		model.put("cantidadDeCondimentos", Sanguchetto.getInstance().verCondimentos().size());
		model.put("stockIngredientes", Sanguchetto.getInstance().verIngredientes().size());
		model.put("stockCondimentos", Sanguchetto.getInstance().verCondimentos().size());
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
		DecimalFormat df = new DecimalFormat("0.00");
		
		model.put("precioSangucheSinDescuento", df.format(Sanguchetto.getInstance().getPrecio()).toString());
		model.put("porcentajeDeDescuento", df.format(Descuento.getPorcentajeDeDescuento()).toString());
		model.put("cantidadDeIngredientes",Sanguchetto.getInstance().verIngredientes().size());
		model.put("cantidadDeCondimentos", Sanguchetto.getInstance().verCondimentos().size());
		model.put("descuento", Descuento.correspondeDescuento(Sanguchetto.getInstance().getPrecio()));
		model.put("sanguche", Sanguchetto.getInstance().verIngredientesYCantidad());
		model.put("precio", df.format(Descuento.aplicarASanguchetto(Sanguchetto.getInstance().getPrecio())).toString());
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
		model.put("ingredienteABorrar", new Ingrediente());
		return new ModelAndView("stock", model);
	}

	@RequestMapping(path = "/agregarStock", method = RequestMethod.POST)
	public String agregarStock(@ModelAttribute("ingredienteYCantidad") BeanParaSelect ingredienteyCantidad, BindingResult result) {
		if(ingredienteyCantidad.getCantidad() == null || ingredienteyCantidad.getCantidad() < 0)
			result.rejectValue("cantidad", "precNoVal");
		if (result.hasErrors())
			return "redirect:/stock";
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
		if (ingredienteAgregado.getPrecio() == null || ingredienteAgregado.getPrecio()< 0)
			result.rejectValue("precio", "precNoVal");
		if (result.hasErrors() || ingredienteAgregado.getNombre().isEmpty())
			return "redirect:/stock";
		Stock.getInstance().agregarIngrediente(ingredienteAgregado);
		return "redirect:/stock";
	}
	
	@RequestMapping(path="/borrarIngredienteDeStock", method = RequestMethod.POST)
	public String borrarIngredienteDeStock(@ModelAttribute("ingredienteABorrar")Ingrediente ingredienteABorrar) {
		Stock.getInstance().eliminarIngrediente(ingredienteABorrar);
		return "redirect:/stock";
	}
	
	@RequestMapping(path="/sacarDeSanguchetto", method = RequestMethod.POST)
	public String sacarDeSanguchetto(@ModelAttribute("ingredienteASacar")Ingrediente ingredienteASacar){
		Sanguchetto.getInstance().sacarIngrediente(ingredienteASacar);
		Stock.getInstance().agregarStock(ingredienteASacar, 1);
		return "redirect:/";
	}
}
