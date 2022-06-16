/ const { expect, it } = require("@jest/globals");
// const { describe } = require("yargs");
const {suma, resta, multiplicacion, division} = require("../calc");

describe("Pruebas de suma", () => {

  test("Suma de positivos", () => {
    expect(suma(10,5)).toBe(15);
  })

  it("Suma de negativos", () => {
    expect(suma(6,-1)).toBe(5);
  })

  it("Suma NaN", () => {
    expect(suma(74,"A")).toBe(0);
  })
})

describe("Pruebas de resta", () => {

  test("Salida de resta con numeros positivos", () => {
    expect(resta(50,10)).toBe(40);
  })

  it("Salida de resta con valor no-numerico", () => {
    expect(resta(7,"A")).toBe(0);
  })
})

describe("Pruebas de división", () => {

  test("Salida de división con numeros positivos", () => {
    expect(division(30,3)).toBe(10);
  })

  it("Salida de divisón con valor no-numerico", () => {
    expect(division(9,"A")).toBe(0);
  })
})

describe("Pruebas de multiplicación", () => {

  test("Salida de multiplicacion con numeros positivos", () => {
    expect(multiplicacion(2,5)).toBe(10);
  })

  it("Salida de multiplicacion con valor no-numerico", () => {
    expect(multiplicacion(9,"Z")).toEqual(0);
  })
})