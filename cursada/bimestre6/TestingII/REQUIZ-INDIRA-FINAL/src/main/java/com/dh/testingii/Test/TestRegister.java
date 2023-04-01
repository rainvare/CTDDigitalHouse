package com.dh.testingii.Test;
/**
 Test Class - @author Rainvare - Final Testing II - CTD
 **/
import com.dh.testingii.Pages.RegisterPage;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestRegister {
    private static RegisterPage page;

    @BeforeAll
    static void setUp() {
        page = new RegisterPage();
        page.openApp();
    }

    @Test
    @Tag("Regression")
    public void testRegister() throws InterruptedException {
        page.clickRegister();
        page.fillForm(
                "Juan",
                "Perez",
                "Av. Urdaneta",
                "Caracas",
                "CSS",
                "11009572",
                "58199861370",
                "10",
                "juan-perez",
                "123456789"
        );
        page.saveRegister();
        String msg = page.verifyMsg();
        assertTrue(msg.contains("Your account was created successfully. You are now logged in."));
    }

    @AfterAll
    static void tearDown() {
        page.quitDriver();
    }
}

