package com.digitalbooking;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class DigitalBookingSearchTest {

	private WebDriver driver;

	@Test
	public void testSearch() throws InterruptedException {
		System.setProperty("webdriver.chrome.driver", "./src/test/resources/chromedriver/chromedriver.exe");
		driver = new ChromeDriver();
		driver.manage().window().maximize();
		driver.get("http://testing.ctd.academy/");
		WebElement searchBox = driver.findElement(By.id("ciudad"));
		searchBox.clear();
		searchBox.sendKeys("punta del este");
		Thread.sleep(1000);
		searchBox.sendKeys(Keys.ENTER);
		Thread.sleep(5000);
		WebElement buscar = driver.findElement(By.id("btn-buscador"));
		buscar.click();
		Thread.sleep(5000);
		WebElement resultado = driver.findElement(By.className("card-list"));
		String res = resultado.getText();
		System.out.println("Resultado Card value: " + res);

		assertTrue(res.contains("Villa Kantounes Studio Ostria"));

		driver.quit();
	}
}