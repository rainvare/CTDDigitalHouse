package com.dh.testingii.Test.Front;
/**
 Test Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Pages.AccountActivityPage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestAccountActivity {

    private static AccountActivityPage page;

    @BeforeAll
    static void setUp() {
        page = new AccountActivityPage();
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

