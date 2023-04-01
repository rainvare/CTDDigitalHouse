package com.dh.testingii.Pages;
/**
 Page Class - @author Rainvare - Final  Testing II - CTD
 **/

import com.dh.testingii.Base.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class AccountActivePage extends BasePage {

    protected static final String accountOverview = "//*[@id=\"leftPanel\"]/ul/li[2]/a"; // XPATH
    protected static final String msg = "//*[@id=\"accountTable\"]/tfoot/tr/td"; // XPATH
    protected static final String firstOption = "//*[@id=\"accountTable\"]/tbody/tr[1]/td[1]/a"; // XPATH
    protected static final String accountDetails = "//*[@id=\"rightPanel\"]/div/div[1]/h1"; // XPATH
    protected static final String firstAll = "//*[@id=\"month\"]/option[1]"; // XPATH
    protected static final String secondAll = "//*[@id=\"transactionType\"]/option[1]"; // XPATH
    protected static final String go = "//*[@id=\"rightPanel\"]/div/div[2]/form/table/tbody/tr[3]/td[2]/input"; //XPATH


    public void clickAccountOverview() throws InterruptedException{
        WebElement btnOverAcc = getWebElement(By.xpath(accountOverview));
        btnOverAcc.click();
        Thread.sleep(2000);
    }
    public String checkMsgBalance() throws InterruptedException{
        WebElement msgBalance = getWebElement(By.xpath(msg));
        Thread.sleep(2000);
        return msgBalance.getText();
    }

    public void clickFirstAccount() throws InterruptedException{
        WebElement account = getWebElement(By.xpath(firstOption));
        account.click();
        Thread.sleep(2000);
    }

    public String checkAccountDetails() throws InterruptedException{
        WebElement accDetails = getWebElement(By.xpath(accountDetails));
        Thread.sleep(2000);
        return accDetails.getText();
    }

    public void selectAccountActivityPeriod() throws InterruptedException{
        WebElement activityPeriod = getWebElement(By.xpath(firstAll));
        activityPeriod.click();
        Thread.sleep(2000);
    }
    public void selectAccountActivityType() throws InterruptedException{
        WebElement activityType = getWebElement(By.xpath(secondAll));
        activityType.click();
        Thread.sleep(2000);
    }



    public void clickGo() {
        WebElement btn = getWebElement(By.xpath(go));
        btn.click();
    }
}
