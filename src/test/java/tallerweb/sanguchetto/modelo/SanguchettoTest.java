package tallerweb.sanguchetto.modelo;

import org.junit.Assert;
import org.junit.Test;

import tallerweb.sangucheto.modelo.Ingrediente;
import tallerweb.sangucheto.modelo.Sanguchetto;
import tallerweb.sangucheto.modelo.TipoIngrediente;

public class SanguchettoTest {

    @Test
    public void testVaciar() {
        Sanguchetto sangu = Sanguchetto.getInstance();
        Ingrediente mayo = new Ingrediente();
        mayo.setNombre("mayonesa");
        mayo.setPrecio((double) 55);
        mayo.setTipo(TipoIngrediente.INGREDIENTE);
        sangu.agregarIngrediente(mayo);
        sangu.vaciar();
        Assert.assertEquals(0, sangu.verIngredientes().size());
    }

    @Test
    public void testAgregarIngrediente() {
        // Implementar
    }

    @Test
    public void testVerIngredientes() {
        // Implementar
    }

    @Test
    public void testVerCondimentos() {
        // Implementar
    }

    @Test
    public void testGetPrecio() {
        // Implementar
    }
}
