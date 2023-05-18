/*
	Crear un programa que cumpla los siguientes puntos:

1. Tener una estructura llamada Product con los campos ID, Name, Price,
Description y Category.
2. Tener un slice global de Product llamado Products, instanciado con
valores.
3. Dos métodos asociados a la estructura Product: Save(), GetAll(). El
método Save() deberá tomar el slice de Products y añadir el producto
desde el cual se llama al método. El método GetAll() deberá imprimir todos
los productos guardados en el slice Products.
4. Una función getById() a la cual se le deberá pasar un INT como parámetro
y retorna el producto correspondiente al parámetro pasado.
5. Ejecutar al menos una vez cada método y función definidos desde main().
*/
package main

import (
	"errors"
	"fmt"
)

var Products []Product

type Product struct {
	ID          int
	Name        string
	Price       float64
	Description string
	Category    string
}

func (p Product) Save() {
	Products = append(Products, p)
}

func (p Product) GetAll() {
	fmt.Println(Products)
}

func getById(id int) (Product, error) {
	for _, v := range Products {
		if v.ID == id {
			return v, nil
		}
	}
	return Product{}, errors.New("Ese producto no existe")
}

func main() {
	p1 := Product{
		ID:          1,
		Name:        "Giratiempo",
		Price:       10000.00,
		Description: "Artefacto para manipular el tiempo",
		Category:    "Joyas",
	}
	p2 := Product{
		ID:          2,
		Name:        "Nimbus",
		Price:       2000.00,
		Description: "Escoba voladora de alta gama",
		Category:    "Escobas",
	}

	p1.Save()
	p2.Save()
	p1.GetAll()

	var success, fail = getById(1)
	if fail == nil {
		fmt.Println(success)
	} else {
		fmt.Println(fail)
	}

}
