package com.dh.testingii.Base;
/**
 Base Class - @author Rainvare - Final Testing II - CTD
 **/

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
public class BasePage {

    public static WebDriver driver;
    protected static final String URL = "https://parabank.parasoft.com/parabank/index.htm";
    protected static final String login = "//*[@id=\"loginPanel\"]/form/div[1]/input"; // XPATH
    protected static final String password = "//*[@id=\"loginPanel\"]/form/div[2]/input"; // XPATH
    protected static final String loginBTN = "//*[@id=\"loginPanel\"]/form/div[3]/input"; // XPATH

    public BasePage() {
        if (driver == null) {
            System.setProperty("webdriver.http.factory", "jdk-http-client");
            System.setProperty("webdriver.chrome.whitelistedIps", "");
            System.setProperty("webdriver.chrome.driver", ".\\src\\main\\resources\\chromedriver.exe");
            this.driver = new ChromeDriver();
            getDriver().manage().window().maximize();
        }
    }

    //Abrir web
    public void openApp(){
        getDriver().get(URL);
    }

    public WebDriver getDriver() {
        return driver;
    }

    public WebElement getWebElement(By locator) {
        WebElement element = null;
        try {
            element = driver.findElement(locator);
        } catch (Exception e) {
            System.out.println("No encontrado"+ locator);
            System.out.println("Error: " + e.getMessage());
        }
        return element;
    }


// login de usuario
    public void loginUser() throws InterruptedException {
        WebElement loginInput = getWebElement(By.xpath(login));
        loginInput.sendKeys("juan-perez");
        WebElement passwordInput = getWebElement(By.xpath(password));
        passwordInput.sendKeys("123456789");
        Thread.sleep(1000);
        WebElement btn = getWebElement(By.xpath(loginBTN));
        btn.click();
        Thread.sleep(2000);



    }

    public void quitDriver() {
        getDriver().quit();
    }
}
