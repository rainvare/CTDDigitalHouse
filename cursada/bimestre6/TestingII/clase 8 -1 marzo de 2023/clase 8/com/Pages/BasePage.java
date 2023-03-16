package com.Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class BasePage {

     protected static WebDriver driver;

     public static void setup() {
          System.setProperty("webdriver.chrome.driver", "./src/test/resources/chromedriver/chromedriver.exe");
          driver = new ChromeDriver();
          driver.manage().window().maximize();
     }

     public static void url(String URL) {
          driver.get(URL);
     }

     public static void salir() {
          driver.quit();
     }
}
