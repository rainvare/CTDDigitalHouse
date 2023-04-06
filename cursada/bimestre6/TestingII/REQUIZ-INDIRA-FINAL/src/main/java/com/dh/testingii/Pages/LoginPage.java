package com.dh.testingii.Pages;

import com.dh.testingii.Base.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class LoginPage extends BasePage {
    protected static final String username = "//*[@id=\"loginPanel\"]/form/div[1]/input"; //xpath
    protected static final String password = "//*[@id=\"loginPanel\"]/form/div[2]/input"; //xpath
    protected static final String btnLogin = "//*[@id=\"loginPanel\"]/form/div[3]/input"; //xpath

    public void clickLogin(String username, String password) {

        WebElement inputUsername = getWebElement(By.xpath(LoginPage.username));
        inputUsername.sendKeys(username);
        WebElement inputPassword = getWebElement(By.xpath(LoginPage.password));
        inputPassword.sendKeys(password);

        WebElement clickButtonLogin = getWebElement(By.xpath(btnLogin));
        clickButtonLogin.click();
    }
}
