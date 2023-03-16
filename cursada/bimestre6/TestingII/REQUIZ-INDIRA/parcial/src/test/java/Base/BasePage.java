/**
 Base Class - @author Rainvare - Parcial Testing II - CTD
 **/

package Base;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class BasePage {

    public static WebDriver driver;
    private static WebDriverWait wait;
    protected static final String URL = "https://opencart.abstracta.us/index.php?route=common/home";

    public WebDriver BasePage() {
        System.setProperty("webdriver.chrome.driver", "./src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        wait = new WebDriverWait(driver, Duration.ofSeconds(2));
        getDriver().get(URL);
        return driver;
    }

    public void openApp() {
        driver.get(URL);
    }

    public WebDriver getDriver() {
        return driver;
    }

    public WebElement getWebElement(By locator) {
        WebElement element = null;
        try {
            element  = driver.findElement(locator);
        } catch (Exception e) {
            System.out.println("No encontrado el elemento: "+ locator);
            System.out.println("Error: "+ e);
        }
        return element ;
    }

    public void quitDriver(){
        getDriver().quit();
    }


}
