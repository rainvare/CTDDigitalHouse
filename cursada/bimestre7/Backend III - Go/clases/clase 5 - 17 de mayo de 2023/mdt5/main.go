package main

import "fmt"

const (
	Grande   = "Grande"
	Mediano  = "Mediano"
	Pequenio = "Pequenio"
)

type producto struct {
	tipo   string
	nombre string
	precio float64
}

type tienda struct {
	productos []producto
}

type Producto interface {
	CalcularCosto() float64
}

type Ecommerce interface {
	Total() float64
	Agregar(producto)
}

func nuevoProducto(tipo string, nombre string, precio float64) (p producto) {
	p.nombre = nombre
	p.tipo = tipo
	p.precio = precio

	return
}

func nuevoEcommerce() (e Ecommerce) {
	return
}

func (t tienda) Total() (total float64) {
	for _, v := range t.productos {
		total += v.precio
	}

	return
}

func (t tienda) Agregar(p producto) {
	t.productos = append(t.productos, p)
}

func (p producto) CalcularCosto() (total float64) {
	switch p.tipo {
	case Grande:
		total = p.precio
	case Mediano:
		total = p.precio + p.precio*0.03
	case Pequenio:
		total = p.precio + p.precio*0.06 + 2500.0
	}

	return
}

func main() {

	producto := nuevoProducto(Grande, "P1", 32.6)
	producto2 := nuevoProducto(Pequenio, "P2", 32.6)

	fmt.Println(producto)
	
	fmt.Println(producto2)


	fmt.Println(producto.CalcularCosto())
	fmt.Println(producto2.CalcularCosto())

}
