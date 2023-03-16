/**
 RegisterPage Class - @author Rainvare - Parcial Testing II - CTD
 **/

package Pages;

import Base.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class RegisterPage extends BasePage {
    // Register inputs xpaths
    private static final String myAccount = "//*[@id=\"top-links\"]/ul/li[2]/a";

    private static final String btnRegister = "//*[@id=\"top-links\"]/ul/li[2]/ul/li[1]";

    private static final String firstName = "//*[@id=\"input-firstname\"]";

    private static final String lastName = "//*[@id=\"input-lastname\"]";

    private static final String email = "//*[@id=\"input-email\"]";

    private static final String telephone = "//*[@id=\"input-telephone\"]";

    private static final String password = "//*[@id=\"input-password\"]";

    private static final String confirmPassword = "//*[@id=\"input-confirm\"]";

    private static final String newsletter = "/html/body/div[2]/div/div/form/fieldset[3]/div/div/label[2]";

    private static final String checkbox = "/html/body/div[2]/div/div/form/div/div/input[1]";

    private static final String btnContinue = "/html/body/div[2]/div/div/form/div/div/input[2]";

    private static final String assertSignUp = "/html/body/div[2]/div/div/p[1]";

    // --------------------------------------------------------------------


    public void signUp(String name, String lastName, String email, String telephone, String password) throws InterruptedException {
        WebElement clickingMyAccount = getWebElement(By.xpath(myAccount));
        clickingMyAccount.click();
        Thread.sleep(200);
        WebElement clickingRegister = getWebElement(By.xpath(btnRegister));
        clickingRegister.click();
        Thread.sleep(200);
        WebElement insertFirstName = getWebElement(By.xpath(firstName));
        insertFirstName.click();
        insertFirstName.sendKeys(name);
        WebElement insertLastName = getWebElement(By.xpath(RegisterPage.lastName));
        insertLastName.click();
        insertLastName.sendKeys(lastName);
        WebElement insertEmail = getWebElement(By.xpath(RegisterPage.email));
        insertEmail.click();
        insertEmail.sendKeys(email);
        WebElement insertTelephone = getWebElement(By.xpath(RegisterPage.telephone));
        insertTelephone.click();
        insertTelephone.sendKeys(telephone);
        WebElement insertPassword = getWebElement(By.xpath(RegisterPage.password));
        insertPassword.click();
        insertPassword.sendKeys(password);
        WebElement confirmingPassword = getWebElement(By.xpath(confirmPassword));
        confirmingPassword.click();
        confirmingPassword.sendKeys(password);
        WebElement newsletterStep = getWebElement(By.xpath(newsletter));
        newsletterStep.click();
        WebElement checkboxStep = getWebElement(By.xpath(checkbox));
        checkboxStep.click();
        WebElement continueStep = getWebElement(By.xpath(btnContinue));
        continueStep.click();
        Thread.sleep(200);
        WebElement lastStep = getWebElement(By.xpath(assertSignUp));
        lastStep.getText().contains("Congratulations! Your new account has been successfully created!");
        //¡Felicitaciones! Su nueva cuenta se ha creado con éxito
        Thread.sleep(1500);
    }

}
