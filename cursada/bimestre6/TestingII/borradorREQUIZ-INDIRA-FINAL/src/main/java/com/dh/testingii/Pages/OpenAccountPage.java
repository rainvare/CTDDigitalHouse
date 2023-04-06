package com.dh.testingii.Pages;
/**
 Page Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Base.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class OpenAccountPage extends BasePage {

    protected static final String openNewAccount = "//*[@id=\"leftPanel\"]/ul/li[1]/a"; // XPATH
    protected static final String optionSavings = "//*[@id=\"type\"]/option[2]"; // XPATH
    protected static final String openNewAccountBtn = "//*[@id=\"rightPanel\"]/div/div/form/div/input"; // XPATH
    protected static final String successMsg = "//*[@id=\"rightPanel\"]/div/div/p[1]"; // XPATH


    public void openNewAccount ()  throws InterruptedException{
        WebElement openNewAccountLink = getWebElement(By.xpath(openNewAccount));
        openNewAccountLink.click();
        Thread.sleep(2000);
    }

    public void selectOptionSavings() throws InterruptedException{
        WebElement option = getWebElement(By.xpath(optionSavings));
        option.click();
        Thread.sleep(2000);
    }

    public void clickOpenNewAccount() throws InterruptedException{
        WebElement btn = getWebElement(By.xpath(openNewAccountBtn));
        btn.click();
        Thread.sleep(2000);
    }

    public String verifyMsgSuccess() {
        WebElement msg = getWebElement(By.xpath(successMsg));
        return msg.getText();
    }

}
