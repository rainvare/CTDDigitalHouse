package com.Pages;

import java.time.Duration;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class SearchPage extends BasePage {
     static WebDriverWait wait = new WebDriverWait(driver, Duration.ofMillis(1000));

     static WebElement searchBox = driver.findElement(By.id("ciudad"));
     static WebElement buscar = driver.findElement(By.id("btn-buscador"));
     static WebElement menu = driver.findElement(By.className("main-header__navbar"));
     static WebElement menuMobile = driver.findElement(By.className("main-header__menu-hamburguesa"));
     static WebElement resultado = driver.findElement(By.className("card-list"));

     public static void escribirCampoBusqueda(String ciudades) throws InterruptedException {
          wait.until(ExpectedConditions.presenceOfElementLocated(By.id("ciudad")));
          searchBox.clear();
          searchBox.sendKeys(ciudades);
          // wait.until(ExpectedConditions.elementToBeSelected(By.id("ciudad")));
          searchBox.sendKeys(Keys.ENTER);
     }

     public static void clickBuscar() throws InterruptedException {
          wait.until(ExpectedConditions.elementToBeClickable(By.id("btn-buscador")));
          buscar.click();
     }

     public static String obtenerTexto() throws InterruptedException {
          wait.until(ExpectedConditions.presenceOfElementLocated(By.className("card-list")));
          String res = resultado.getText();
          System.out.println("Resultado Card value: " + res);
          return res;
     }
}