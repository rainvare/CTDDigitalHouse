package com.dh.testingii.Pages;
/**
 Page Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Base.BasePage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class OverviewBillPage extends BasePage {

    protected static final String overviewBTN = "//*[@id=\"leftPanel\"]/ul/li[2]/a"; // XPATH
    protected static final String balance = "//*[@id=\"accountTable\"]/tfoot/tr/td"; // XPATH

    public void clickAccountsOverview() throws InterruptedException{
        WebElement overview = getWebElement(By.xpath(overviewBTN));
        overview.click();
        Thread.sleep(2000);
    }

    public String checkText() throws InterruptedException{
        WebElement text = getWebElement(By.xpath(balance));
        Thread.sleep(2000);
        return text.getText();

    }
}
