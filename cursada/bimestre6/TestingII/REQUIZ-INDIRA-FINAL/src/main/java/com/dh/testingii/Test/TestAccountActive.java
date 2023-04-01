package com.dh.testingii.Test;
/**
 Test Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Pages.AccountActivePage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestAccountActive {

    private static AccountActivePage page;

    @BeforeAll
    static void setUp() {
        page = new AccountActivePage();
        page.openApp();
    }

    @Test
    @Tag("Regression")
    public void testTransfer() throws InterruptedException {
        page.loginUser();
        page.clickAccountOverview();
        String msg = page.checkMsgBalance();
        assertTrue(msg.contains("*Balance includes deposits that may be subject to holds"));
        page.clickFirstAccount();
        String message = page.checkAccountDetails();
        assertTrue(message.contains("Account Details"));
        page.selectAccountActivityPeriod();
        page.selectAccountActivityType();
        page.clickGo();


    }

    @AfterAll
    static void tearDown() {
        page.quitDriver();
    }
}

