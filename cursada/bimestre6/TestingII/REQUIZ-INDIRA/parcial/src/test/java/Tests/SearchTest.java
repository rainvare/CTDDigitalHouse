/**
 SearchTest Class - @author Rainvare - Parcial Testing II - CTD
 **/

package Tests;

import Base.BasePage;
import Pages.SearchPage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.WebDriver;

public class SearchTest {
    private static WebDriver driver;

    @BeforeAll
    static void setUp() {
        BasePage basePage = new BasePage();
        basePage.openApp();

    }

    @Test
    public void searchTest() throws InterruptedException {

        SearchPage page = new SearchPage();
        page.addProduct("Iphone");
        Thread.sleep(300);

        System.out.println("Product testing successfully");

    }

    @AfterAll
    static void closeTest() {
        driver.quit();
    }
}
