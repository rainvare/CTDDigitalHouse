/**
 Base Class - @author Rainvare - Parcial Testing II - CTD
 **/

package Base;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class BasePage {

    protected static WebDriver driver;
    protected static final String url = "https://opencart.abstracta.us/index.php?route=common/home";
    protected static WebDriverWait wait;


    public static WebDriver setUpConnection() {
        System.setProperty("webdriver.chrome.driver", "./src/test/resources/chromedriver.exe");
            driver = new ChromeDriver();
            driver.manage().window().maximize();
        wait = new WebDriverWait(driver, Duration.ofSeconds(2));
        return driver;
    }

    public void openApp() {
        driver.get(url);
            }

    public WebElement findElement(By locator) {
        return driver.findElement(locator);
    }

    public void writeInput(String input, By locator) {
        driver.findElement(locator).clear();
        driver.findElement(locator).sendKeys(input);
    }

    public void click(By locator) {
        driver.findElement(locator).click();
    }

    public void enter(By locator) {
        driver.findElement(locator).sendKeys(Keys.ENTER);
    }



    public void quit(){
        driver.quit();
    }


}
