package com.dh.testingii.Pages;
/**
 Page Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Base.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class TransferPage extends BasePage {

    protected static final String funds = "//*[@id=\"leftPanel\"]/ul/li[3]/a"; // XPATH
    protected static final String msg = "//*[@id=\"rightPanel\"]/div/div/h1"; // XPATH
    protected static final String amount = "amount"; // ID
    protected static final String firstOption = "//*[@id=\"fromAccountId\"]/option[1]"; // XPATH
    protected static final String anotherAccount = "//*[@id=\"fromAccountId\"]/option[2]"; // XPATH
    protected static final String transfer = "//*[@id=\"rightPanel\"]/div/div/form/div[2]/input"; // XPATH
    protected static final String msgComplete = "//*[@id=\"rightPanel\"]/div/div/h1"; // XPATH


    public void clickTransferFunds() throws InterruptedException{
        WebElement btn = getWebElement(By.xpath(funds));
        btn.click();
        Thread.sleep(2000);
    }

    public String verifyMsg() throws InterruptedException{
        WebElement message = getWebElement(By.xpath(msg));
        Thread.sleep(2000);
        return message.getText();

    }

    public void fillAmount() throws InterruptedException{
        WebElement amountIp = getWebElement(By.id(amount));
        amountIp.sendKeys("20");
        Thread.sleep(2000);
    }

    public void selectAccount() throws InterruptedException{
        WebElement first = getWebElement(By.xpath(firstOption));
        first.click();
        Thread.sleep(2000);
    }

    public void selectAnotherAccount() throws InterruptedException{
        WebElement another = getWebElement(By.xpath(anotherAccount));
        another.click();
        Thread.sleep(2000);
    }

    public void clickTransfer() throws InterruptedException{
        WebElement btn = getWebElement(By.xpath(transfer));
        btn.click();
        Thread.sleep(2000);
    }

    public String verifyMsgComplete() throws InterruptedException{
        WebElement msg = getWebElement(By.xpath(msgComplete));
        Thread.sleep(2000);
        return msg.getText();

    }
}

