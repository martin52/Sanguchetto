package tallerweb.sanguchetto.modelo;

import static org.junit.Assert.assertTrue;

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
    	Sanguchetto sandwich = Sanguchetto.getInstance();
    	sandwich.vaciar();
    	//Un Ingrediente
    	Ingrediente queso = new Ingrediente();
    	queso.setNombre("queso");
    	queso.setPrecio(20.0);
    	queso.setTipo(TipoIngrediente.INGREDIENTE);  
    	//Un Condimento
        Ingrediente oregano = new Ingrediente();
        oregano.setNombre("oregano");
        oregano.setPrecio(1.0);
        oregano.setTipo(TipoIngrediente.CONDIMENTO);
        sandwich.agregarIngrediente(queso);
        sandwich.agregarIngrediente(oregano);
        //System.out.println(sandwich.verIngredientes().size());
        assertTrue(sandwich.verIngredientes().size()==1 && sandwich.verCondimentos().size()==1 ); 
    }

    @Test
    public void testVerIngredientes() {
        // Implementar
        Sanguchetto sandwich = Sanguchetto.getInstance();
        sandwich.vaciar();
        Ingrediente bondiola = new Ingrediente();
        bondiola.setNombre("bondiola");
        bondiola.setPrecio(15.0);
        bondiola.setTipo(TipoIngrediente.INGREDIENTE);
        sandwich.agregarIngrediente(bondiola);
        
        Ingrediente mostaza = new Ingrediente();
        mostaza.setNombre("mostaza");
        mostaza.setPrecio(15.0);
        mostaza.setTipo(TipoIngrediente.CONDIMENTO);
        
        for( Ingrediente i : sandwich.verIngredientes()){
        	assertTrue(i.getTipo().equals(TipoIngrediente.INGREDIENTE));
        }     
    }

    @Test
    public void testVerCondimentos() {
        // Implementar
        Sanguchetto sandwich = Sanguchetto.getInstance();
        sandwich.vaciar();
        Ingrediente bondiola = new Ingrediente();
        bondiola.setNombre("bondiola");
        bondiola.setPrecio(15.0);
        bondiola.setTipo(TipoIngrediente.INGREDIENTE);
        
        Ingrediente mostaza = new Ingrediente();
        mostaza.setNombre("mostaza");
        mostaza.setPrecio(15.0);
        mostaza.setTipo(TipoIngrediente.CONDIMENTO);
        sandwich.agregarIngrediente(mostaza);
        
        for( Ingrediente i : sandwich.verIngredientes()){
        	assertTrue(i.getTipo().equals(TipoIngrediente.CONDIMENTO));
        }
    }

    @Test
    public void testGetPrecio() {
        // Implementar
        Sanguchetto sandwich = Sanguchetto.getInstance();
        sandwich.vaciar();
        Ingrediente pollo = new Ingrediente();
        pollo.setNombre("pollo");
        pollo.setPrecio(50.0);
        pollo.setTipo(TipoIngrediente.INGREDIENTE);
        sandwich.agregarIngrediente(pollo);        
        assertTrue(pollo.getPrecio()==50.0);
    }
}
