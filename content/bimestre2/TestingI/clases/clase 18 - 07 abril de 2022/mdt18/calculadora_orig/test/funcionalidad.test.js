const { expect } = require("@jest/globals");
const fs = require("fs");
document.body.innerHTML = fs.readFileSync("./calculadora.html");
const { init, limpiar, resetear, resolver} = require("../funcionalidad.js");

describe("prueba de Init", () => {
    test("prueba click", () => {
        const click = init();
        expect(click).toBeTruthy;
    })
    
})

describe("prueba de Limpiar", () => {
    test("prueba limpiar", () => {
        const click = limpiar();
        expect(click).toBeTruthy;
    })
    
})

describe("prueba de resetear", () => {
    test("prueba resetear", () => {
        const click = resetear();
        expect(click).toBeTruthy;
    })

    test("prueba resultado", () => {
        const resultado = document.getElementById('resultado');
        const click = resetear();
        expect(click).toBeTruthy;
        expect(resultado.innerHTML).toBe("");

    })

    
})

describe("prueba de resolver", () => {
    test("prueba resolver", () => {
        const click = resolver();
        expect(click).toBeTruthy;
    })

    test("prueba igual", () => {
        const boton = document.querySelector('#igual')

        const click = resolver();
        expect(boton.onclick).toBeTruthy;
        expect(click).toBeTruthy;
    })

    
})

