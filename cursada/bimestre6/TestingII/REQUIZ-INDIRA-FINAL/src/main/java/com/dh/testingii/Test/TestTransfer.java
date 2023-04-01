package com.dh.testingii.Test;
/**
 Test Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Pages.TransferPage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestTransfer {

    private static TransferPage page;

    @BeforeAll
    static void setUp() {
        page = new TransferPage();
        page.openApp();
    }

    @Test
    @Tag("Smoke")
    public void testTransfer() throws InterruptedException {
        page.loginUser();
        page.clickTransferFunds();
        String msg = page.verifyMsg();
        assertTrue(msg.contains("Transfer Funds"));
        page.fillAmount();
        page.selectAccount();
        page.selectAnotherAccount();
        page.clickTransfer();
        String message = page.verifyMsgComplete();
        assertTrue(message.contains("Transfer Complete!"));
    }


    @AfterAll
    static void tearDown() {
        page.quitDriver();
    }
}
