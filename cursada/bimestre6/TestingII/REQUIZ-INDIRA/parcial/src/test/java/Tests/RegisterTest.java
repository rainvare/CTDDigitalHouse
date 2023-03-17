/**
 RegisterTest Class - @author Rainvare - Parcial Testing II - CTD
 **/
package Tests;
import Base.BasePage;
import Pages.RegisterPage;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.WebDriver;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class RegisterTest{
    private RegisterPage registerPage;
    private WebDriver driver;

    @BeforeEach
    public void setUpTest() {
        registerPage = new RegisterPage(driver, null);
        driver = BasePage.setUpConnection();
        registerPage.openApp();
    }

    @Test
    public void successfulRegistration() throws InterruptedException {
        registerPage.clickLogin();
        registerPage.singUpForm("Shakira", "Mebarak", "chakichaki@gmail.com", "1180498456", "claramente");
        registerPage.clickContinueBtn1();
        assertTrue(registerPage.pageResult().contains("Congratulations! Your new account has been successfully created!"));
        registerPage.clickContinueBtn2();
    }
    

    @AfterEach
    public void tearDown(){
        driver.quit();
    }

}