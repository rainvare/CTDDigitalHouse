package com.digitalbooking;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

import com.Pages.SearchPage;

public class DigitalBookingSearchTest {
	@BeforeAll
	public void set() {
		SearchPage.setup();
		SearchPage.url("http://testing.ctd.academy/");
	}

	@Test
	public void testSearch() throws InterruptedException {
		SearchPage.escribirCampoBusqueda("este");
		SearchPage.clickBuscar();

		assertTrue(SearchPage.obtenerTexto().contains("Villa Kantounes Studio Ostria"));
	}

	@AfterAll
	public void quit() {
		SearchPage.salir();
	}
}