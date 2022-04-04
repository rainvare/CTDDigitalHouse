# Test: Ingreso de datos

Este programa solicita el ingreso de `Nombre y Edad` y al presionar el botón `Agregar Usuario` arma una lista con los datos ingresados.

![img](./img/cp21.png)

En `util.js`

```js
exports.generateText = (name, age) => {
  // Returns output text
  return `${name} (${age} years old)`;
};

exports.createElement = (type, text, className) => {
  // Creates a new HTML element and returns it
  const newElement = document.createElement(type);
  newElement.classList.add(className);
  newElement.textContent = text;
  return newElement;
};

exports.validateInput = (text, notEmpty, isNumber) => {
  // Validate user input with two pre-defined rules
  if (!text) {
    return false;
  }
  if (notEmpty && text.trim().length === 0) {
    return false;
  }
  if (isNumber && +text === NaN) {
    return false;
  }
  return true;
};
```

En `util.test.js`

```js
const { generateText } = require('../util.js');


test('Salida de Nombre y Edad', () => {
    const text = generateText('Liliana',30);
    expect(text).toBe('Liliana (30 years old)');
});
```

![img](./img/cp22.png)

## Haciendo modificaciones a `util.js`

> Cambie la variable `age` por `name`

En `util.js`
```js
exports.generateText = (name, age) => {
  // Returns output text
  return `${name} (${name} years old)`;
};

exports.createElement = (type, text, className) => {
  // Creates a new HTML element and returns it
  const newElement = document.createElement(type);
  newElement.classList.add(className);
  newElement.textContent = text;
  return newElement;
};

exports.validateInput = (text, notEmpty, isNumber) => {
  // Validate user input with two pre-defined rules
  if (!text) {
    return false;
  }
  if (notEmpty && text.trim().length === 0) {
    return false;
  }
  if (isNumber && +text === NaN) {
    return false;
  }
  return true;
};
```

En `util.test.js`

```js
const { generateText } = require('../util.js');


test('Salida de Nombre y Edad', () => {
    const text = generateText('Liliana',30);
    expect(text).toBe('Liliana (30 years old)');
});
```

En terminal:

![img](./img/cp23.png)

## Agrupamos casos de prueba

En `util.js`

```js
exports.generateText = (name, age) => {
  // Returns output text
  return `${name} (${age} years old)`;
};

exports.createElement = (type, text, className) => {
  // Creates a new HTML element and returns it
  const newElement = document.createElement(type);
  newElement.classList.add(className);
  newElement.textContent = text;
  return newElement;
};

exports.validateInput = (text, notEmpty, isNumber) => {
  // Validate user input with two pre-defined rules
  if (!text) {
    return false;
  }
  if (notEmpty && text.trim().length === 0) {
    return false;
  }
  if (isNumber && +text === NaN) {
    return false;
  }
  return true;
};
```

En `util.test.js`

```js
const { describe } = require("@jest/globals");
const { generateText } = require('../util.js');


describe('Pruebas salida de datos', ()=>{
    test('Salida de Nombre y Edad', () => {
        const text = generateText('Liliana',30);
        expect(text).toBe('Liliana (30 years old)');
    });
    test('Salida con datos vacios', () => {
        const text = generateText('', null);
        expect(text).toBe(' (null years old)');
    });
    test('Salida sin datos', () => {
        const text = generateText();
        expect(text).toBe('undefined (undefined years old)');
    });
    test('Salida con datos invertidos', () => {
        const text = generateText(30,'Liliana');
        expect(text).toBe('30 (Liliana years old)');
    });

})
```

En la terminal:

![img](./img/cp24.png)

## [⏪ Atrás](../README.md)