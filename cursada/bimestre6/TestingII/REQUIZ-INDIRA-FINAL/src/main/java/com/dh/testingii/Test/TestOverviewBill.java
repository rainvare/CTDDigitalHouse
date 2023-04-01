package com.dh.testingii.Test;
/**
 Test Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Pages.OverviewBillPage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestOverviewBill {

    private static OverviewBillPage page;

    @BeforeAll
    static void setUp() {
        page = new OverviewBillPage();
        page.openApp();
    }

    @Test
    @Tag("Regression")
    public void testOverview() throws InterruptedException {
        page.loginUser();
        page.clickAccountsOverview();
        String msg = page.checkText();
        assertTrue(msg.contains("*Balance includes deposits that may be subject to holds"));
    }

    @AfterAll
    static void tearDown() {
        page.quitDriver();
    }
}