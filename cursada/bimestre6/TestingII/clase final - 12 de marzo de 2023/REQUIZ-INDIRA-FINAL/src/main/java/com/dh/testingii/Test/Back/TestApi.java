package com.dh.testingii.Test.Back;
/**
 Test Class - @author Rainvare - Final Testing II - CTD
 **/

import com.google.gson.Gson;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.json.JSONObject;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;

public class TestApi {

    @BeforeEach
    public void login() {
        RestAssured.baseURI = "https://parabank.parasoft.com/parabank/";

        Map<String, Object> jsonObject = new HashMap<>();
        jsonObject.put("username", "indirarequiz");
        jsonObject.put("password", "123456789");

        given()
                .body(jsonObject)
                .and()
                .when()
                .post("login.html");

    }

    @Test
    @DisplayName("testRegistroURL")
    // Registro URL
    public void testRegistroURL() {
        Map<String, Object> jsonObject = new HashMap<>();

        jsonObject.put("customer.firstName", "Indira");
        jsonObject.put("customer.lastName", "Requiz");
        jsonObject.put("customer.address", "calle Buenos Aires");
        jsonObject.put("customer.address", "Buenos Aires");
        jsonObject.put("customer.address", "Capital Federal");
        jsonObject.put("customer.address", "5555");
        jsonObject.put("customer.phoneNumber", "(+54) 9903185");
        jsonObject.put("customer.ssn", "12");
        jsonObject.put("customer.username", "indirarequiz");
        jsonObject.put("customer.password", "123456789");

        given()
                .body(new Gson().toJson(jsonObject))
                .and()
                .when()
                .get("register.htm")
                .then()
                .statusCode(200);
    }

    @Test
    @DisplayName("testOpenNewAccountURL")
    //	abrir una nueva cuenta (error 401)
    public void testOpenNewAccountURL() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("customerId", "12545");
        jsonObject.put("newAccountType", "1");
        jsonObject.put("fromAccountId", "12551");


        given()
                .header("Content-type", "application/json")
                .contentType(ContentType.JSON)
                .body(jsonObject.toString())
                .when()
                .post("services_proxy/bank/createAccount?customerId=12545&newAccountType=1&fromAccountId=12551")
                .then()
                .statusCode(401); // regresa 401
    }

    @Test
    @DisplayName("testOverview")
    // resumen de cuentas y login exitoso
    public void testOverview() {
        given()
                .when()
                .cookie("JSESSIONID", "529A37A17123046571B3A75FAFB6CA1B")
                .get("overview.htm")
                .then()
                .statusCode(200);
    }

    @Test
    // transferir fondos
    @Tag("Integration")
    @DisplayName("testTransferFoundsURL")
    public void testTransferFoundsURL() {
        Integer fromAccountId = 13566;
        Integer toAccountId = 13677;
        Integer amount = 250;

        given()
                .cookie("JSESSIONID", "529A37A17123046571B3A75FAFB6CA1B")
                .queryParams(Map.of("fromAccountId", fromAccountId,"toAccountId",toAccountId,"amount",amount))
                .when()
                .post("/services_proxy/bank/transfer")
                .then()
                .statusCode(200);

    }

    @Test
    @DisplayName("testActiveAccountAllMonth")
    // historial
    public void testActiveAccountAllMonth() {
        given()
                .when()
                .cookie("JSESSIONID", "529A37A17123046571B3A75FAFB6CA1B")
                .get("services_proxy/bank/accounts/13566/transactions/month/All/type/All")
                .then()
                .statusCode(200);

    }

}
