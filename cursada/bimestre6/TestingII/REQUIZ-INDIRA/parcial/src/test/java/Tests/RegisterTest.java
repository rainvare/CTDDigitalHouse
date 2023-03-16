/**
 RegisterTest Class - @author Rainvare - Parcial Testing II - CTD
 **/
package Tests;
import Base.BasePage;
import Pages.RegisterPage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.WebDriver;

public class RegisterTest extends BasePage {
    private static WebDriver driver;

    @BeforeAll
    static void setUp() {
        BasePage basePage = new BasePage();
        driver = basePage.getDriver();
    }


    @Test
    public void testingRegisterPage() throws InterruptedException {

        RegisterPage page = new RegisterPage();
        page.signUp("Shakira", "Mebarak", "chakichaki@gmail.com", "1180498456", "claramente");
        Thread.sleep(300);

        System.out.println("Registro exitoso");

    }

    @AfterAll
    static void closeTest() {
        driver.quit();
    }

}
