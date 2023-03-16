package com.digitalbooking;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.Pages.SearchPage;

public class DigitalBookingSearchTest {
	@Test
	public void testSearch() throws InterruptedException {
		SearchPage.setup();
		SearchPage.url("http://testing.ctd.academy/");

		SearchPage.escribirCampoBusqueda("este");
		SearchPage.clickBuscar();

		assertTrue(SearchPage.obtenerTexto().contains("Villa Kantounes Studio Ostria"));

		SearchPage.salir();
	}
}