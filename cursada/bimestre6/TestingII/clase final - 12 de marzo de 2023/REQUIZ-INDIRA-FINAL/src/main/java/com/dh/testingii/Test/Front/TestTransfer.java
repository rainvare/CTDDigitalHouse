package com.dh.testingii.Test.Front;
/**
 Test Class - @author Rainvare - Final Testing II - CTD
 **/

import com.dh.testingii.Pages.LoginPage;
import com.dh.testingii.Pages.TransferPage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;
public class TestTransfer {


    private static LoginPage login;
    private static TransferPage transferFunds;

    @BeforeAll
    static void setUp() {
        transferFunds = new TransferPage();
        transferFunds.openApp();

        login = new LoginPage();
        login.clickLogin(
                "juan-perez",
                "123456789"
        );
    }

    @Test
    @Tag("Regression")
    public void testTransfer() throws InterruptedException {
        transferFunds.clickTransferFunds();

        String msg = transferFunds.checkMsg();
        assertTrue(msg.contains("Transfer Funds"));

        transferFunds.fillAmount();
        transferFunds.selectAccount();
        transferFunds.selectAnotherAccount();
        Thread.sleep(2000);
        transferFunds.clickTransfer();

        String message = transferFunds.verifyMsgComplete();
        assertTrue(message.contains("Transfer Complete!"));
    }


    @AfterAll
    static void tearDown() {

        transferFunds.quitDriver();
    }
}
