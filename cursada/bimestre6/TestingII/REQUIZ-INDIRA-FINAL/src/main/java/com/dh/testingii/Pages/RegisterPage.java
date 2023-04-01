package com.dh.testingii.Pages;
/**
 Page Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Base.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class RegisterPage extends BasePage {

    protected static final String register = "//*[@id=\"loginPanel\"]/p[2]/a"; // XPATH
    protected static final String firstNameInput = "customer.firstName"; // ID,
    protected static final String lastNameInput = "customer.lastName"; // ID
    protected static final String addressInput = "customer.address.street"; // ID
    protected static final String cityInput = "customer.address.city"; // ID
    protected static final String stateInput = "customer.address.state"; // ID
    protected static final String zipCodeInput = "customer.address.zipCode"; // ID
    protected static final String phoneInput = "customer.phoneNumber"; // ID
    protected static final String ssnInput = "customer.ssn"; // ID
    protected static final String usernameInput = "customer.username"; // ID
    protected static final String passwordInput = "customer.password"; // ID
    protected static final String confirmInput = "repeatedPassword"; // ID
    protected static final String registerBtn = "//*[@id=\"customerForm\"]/table/tbody/tr[13]/td[2]/input"; //  XPATH
    protected static final String confirmationMessage = "//*[@id=\"rightPanel\"]/p"; // XPATH

    public void clickRegister() throws InterruptedException {
        WebElement registerbtn = getWebElement(By.xpath(register));
        Thread.sleep(2000);
        registerbtn.click();
        Thread.sleep(2000);

    }

    public void fillForm(String name,
                         String lastName,
                         String addressT,
                         String cityT,
                         String stateT,
                         String zipCodeT,
                         String phoneNumberT,
                         String ssnT,
                         String usernameT,
                         String passwordT
    ) throws InterruptedException {
        WebElement firstInput = getWebElement(By.id(firstNameInput));
        firstInput.sendKeys(name);
        Thread.sleep(2000);
        WebElement lastInput = getWebElement(By.id(lastNameInput));
        lastInput.sendKeys(lastName);
        Thread.sleep(2000);
        WebElement address = getWebElement(By.id(addressInput));
        address.sendKeys(addressT);
        Thread.sleep(2000);
        WebElement city = getWebElement(By.id(cityInput));
        city.sendKeys(cityT);
        Thread.sleep(2000);
        WebElement state = getWebElement(By.id(stateInput));
        state.sendKeys(stateT);
        Thread.sleep(2000);
        WebElement zipCode = getWebElement(By.id(zipCodeInput));
        zipCode.sendKeys(zipCodeT);
        Thread.sleep(2000);
        WebElement phoneNumber = getWebElement(By.id(phoneInput));
        phoneNumber.sendKeys(phoneNumberT);
        Thread.sleep(2000);
        WebElement ssn = getWebElement(By.id(ssnInput));
        ssn.sendKeys(ssnT);
        Thread.sleep(2000);
        WebElement username = getWebElement(By.id(usernameInput));
        username.sendKeys(usernameT);
        Thread.sleep(2000);
        WebElement password = getWebElement(By.id(passwordInput));
        password.sendKeys(passwordT);
        Thread.sleep(2000);
        WebElement passwordConf = getWebElement(By.id(confirmInput));
        passwordConf.sendKeys(passwordT);
        Thread.sleep(2000);

    }

    public void saveRegister() throws InterruptedException {
        WebElement btn = getWebElement(By.xpath(registerBtn));
        btn.click();
        Thread.sleep(2000);
    }

    public String verifyMsg() throws InterruptedException {
        WebElement msg = getWebElement(By.xpath(confirmationMessage));
        return msg.getText();
    }
}

