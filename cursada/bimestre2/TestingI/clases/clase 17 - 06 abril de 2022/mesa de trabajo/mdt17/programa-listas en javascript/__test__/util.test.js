const { generateText, validateInput, createElement } = require('../util.js');

describe('Pruebas de salida de datos', () => {
    test('Salida con datos', () =>{
        const text = generateText('Lina',29);
        expect(text).toBe('Lina (29years old)');
    });
    
    test('Salida con datos vacios', () =>{
        const text = generateText('',null);
        expect(text).toBe(' (null years old)');    
    });
    
    test('Salida sin datos', () =>{
        const text = generateText();
        expect(text).toBe('undefined (undefined years old)');    
    });
});

describe('Creacion de elementos', () => {
    test('Creacion de elemento', ()=> {
        const creacionElemento = createElement('li', "Simón", "user-item");
        expect(creacionElemento.className).toBe('user-item');
        expect(creacionElemento.textContent).toBe('Simón');
    })
});