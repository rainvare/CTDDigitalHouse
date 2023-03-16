package com.Pages;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;

public class SearchPage extends BasePage {
     static WebElement searchBox = driver.findElement(By.id("ciudad"));
     static WebElement buscar = driver.findElement(By.id("btn-buscador"));
     static WebElement resultado = driver.findElement(By.className("card-list"));

     public static void escribirCampoBusqueda(String ciudades) throws InterruptedException {
          Thread.sleep(1000);
          searchBox.clear();
          searchBox.sendKeys(ciudades);
          Thread.sleep(1000);
          searchBox.sendKeys(Keys.ENTER);
          Thread.sleep(1000);
     }

     public static void clickBuscar() throws InterruptedException {
          buscar.click();
          Thread.sleep(100);
     }

     public static String obtenerTexto() throws InterruptedException {
          Thread.sleep(2000);
          String res = resultado.getText();
          System.out.println("Resultado Card value: " + res);
          return res;
     }
}
