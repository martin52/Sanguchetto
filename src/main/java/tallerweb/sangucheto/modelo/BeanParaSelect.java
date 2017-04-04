package tallerweb.sangucheto.modelo;

import com.sun.istack.internal.NotNull;

public class BeanParaSelect {
	private String ingrediente;
	
	@NotNull
	private Integer cantidad;

	public String getIngrediente() {
		return ingrediente;
	}

	public void setIngrediente(String ingrediente) {
		this.ingrediente = ingrediente;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

}
