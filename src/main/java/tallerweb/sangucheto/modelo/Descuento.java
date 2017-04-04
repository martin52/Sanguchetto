package tallerweb.sangucheto.modelo;

public class Descuento {
	private static Double porcentajeDeDescuentoSanguchetto = (double) 20;
	
	public static Double getPorcentajeDeDescuento() {
		return porcentajeDeDescuentoSanguchetto;
	}

	public static void setPorcentajeDeDescuento(Double porcentajeDeDescuento) {
		Descuento.porcentajeDeDescuentoSanguchetto = porcentajeDeDescuento;
	}

	public static Double aplicarASanguchetto(Double precio) {
		if(precio>100)
			precio = (100-porcentajeDeDescuentoSanguchetto)*precio/100;
		return precio;
	}
	
	public static boolean correspondeDescuento(Double precio) {
		if(precio>100)
			return true;
		return false;
	}
}
