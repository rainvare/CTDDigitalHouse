package com.digitalbooking;

public class mercadolibre {

    @Test
    public void BusquedaMercadoLibre() throws InterruptedException {
        System.setProperty("webdriver.chrome.driver", "./src/test/resources/chromedriver/chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://www.mercadolibre.com.ar/");
        WebElement campoBusqueda = driver.findElement(By.id("cb1-edit"));
        campoBusqueda.clear();
        campoBusqueda.sendKeys("Iphone 13");
        WebElement buttomBusqueda = driver.findElement(By.xpaht("//div[@aria-label='Buscar']"));
        // campoBusqueda.sendKeys(Keys.ENTER);
        buttomBusqueda.click();
        WebElement filtro256GB = driver.findElement(By.xpaht("//span[normalize-space()='Menos de 256 GB']"));

    }

}
