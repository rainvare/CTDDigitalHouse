/**
 RegisterPage Class - @author Rainvare - Parcial Testing II - CTD
 **/

package Pages;
import Base.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.WebDriverWait;


public class RegisterPage extends BasePage {
    By inputFirstName = By.id("input-firstname");
    By inputLastName = By.id("input-lastname");
    By inputEmail = By.id("input-email");
    By inputTelephone = By.id("input-telephone");
    By inputPassword = By.id("input-password");
    By inputPasswordConfirm = By.id("input-confirm");
    By inputPrivacyPolicy = By.name("agree");
    By myAccount = By.xpath("//ul[@class='list-inline']//li[@class='dropdown']");
    By registration = By.xpath("//*[@id=\"top-links\"]/ul/li[2]/ul/li[1]/a");
    By btnContinue1 = By.xpath("//input[@value='Continue']");
    By message = By.id("content");
    By alert= By.id("account-register");
    By btnContinue2 = By.xpath("//*[@id=\"content\"]/div/div/a");

    public RegisterPage(WebDriver driver, WebDriverWait wait) {
    }
    public String response() throws InterruptedException {
        Thread.sleep(1000);
        String res = findElement(message).getText();
        System.out.println("Result: " + res);
        return res;
    }

    public void clickLogin() throws InterruptedException {
        click(myAccount);
        click(registration);
    }

    public void singUpForm(String name, String lastName, String mail, String tel, String password) throws InterruptedException {
        writeInput(name, inputFirstName);
        writeInput(lastName, inputLastName);
        writeInput(mail, inputEmail);
        writeInput(tel, inputTelephone);
        writeInput(password, inputPassword);
        writeInput(password, inputPasswordConfirm);
        click(inputPrivacyPolicy);
    }

    public void clickContinueBtn1() throws InterruptedException {
        Thread.sleep(2000);
        click(btnContinue1);
    }

    public void clickContinueBtn2() throws InterruptedException {
        Thread.sleep(2000);
        click(btnContinue2);
    }

    public String pageResult() throws InterruptedException {
        Thread.sleep(2000);
        String res= findElement(alert).getText();
        System.out.println("Result: " + res);
        return res;
    }




}
