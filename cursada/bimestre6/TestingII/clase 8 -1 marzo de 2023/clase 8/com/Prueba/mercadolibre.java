package com.Prueba;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class mercadolibre {

    private WebDriver driver;

    @Test
    public void BusquedaMercadoLibre() throws InterruptedException {
        System.setProperty("webdriver.chrome.driver", "./src/test/resources/chromedriver/chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://www.mercadolibre.com.ar/");
        WebElement campoBusqueda = driver.findElement(By.id("cb1-edit"));
        campoBusqueda.clear();
        campoBusqueda.sendKeys("Iphone 13");
        WebElement buttomBusqueda = driver.findElement(By.xpath("//div[@aria-label='Buscar']"));
        // campoBusqueda.sendKeys(Keys.ENTER);
        buttomBusqueda.click();
        WebElement filtro256GB = driver.findElement(By.xpath("//span[normalize-space()='Menos de 256 GB']"));

    }

}
