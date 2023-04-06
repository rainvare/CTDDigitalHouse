package com.dh.testingii.Test.Front;
/**
 Test Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Pages.OpenAccountPage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestOpenAccount {
    private static OpenAccountPage page;

    @BeforeAll
    public static void setUp() {
        page = new OpenAccountPage();
        page.openApp();

    }


    @Test
    @Tag("Smoke")
    public void testOpenAccount() throws InterruptedException {
        page.loginUser();
        page.openNewAccount();
        page.selectOptionSavings();
        page.clickOpenNewAccount();
        String message = page.verifyMsgSuccess();
        assertTrue(message.contains("Congratulations, your account is now open."));
    }
    @AfterAll
    static void tearDown() {
        page.quitDriver();
    }


}
