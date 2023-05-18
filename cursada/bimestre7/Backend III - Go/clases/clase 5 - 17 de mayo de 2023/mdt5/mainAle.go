package main

import (
	"errors"
	"fmt"
	"log"
)

const (
	pequenio = "PEQUENIO"
	mediano  = "MEDIANO"
	grande   = "GRANDE"
)

type Pequenio struct {
	Costo float64
}

type Mediano struct {
	Costo float64
}

type Grande struct {
	Costo float64
}

type Producto interface {
	precio() float64
}

func (p Pequenio) precio() float64 {
	return p.Costo
}

func (m Mediano) precio() float64 {
	var total float64
	total = m.Costo + (m.Costo * (float64(3) / 100))
	return total
}

func (g Grande) precio() float64 {
	var total float64
	total = g.Costo + (g.Costo * (float64(6) / 100)) + float64(2500)
	return total
}

func newPequenio(valor float64) Pequenio {
	return Pequenio{valor}
}

func newMediano(valor float64) Mediano {
	return Mediano{valor}
}

func newGrande(valor float64) Grande {
	return Grande{valor}
}

func factory(producto string, precio float64) (Producto, error) {
	switch producto {
	case pequenio:
		return newPequenio(precio), nil
	case mediano:
		return newMediano(precio), nil
	case grande:
		return newGrande(precio), nil
	default:
		return nil, errors.New("No existe el Producto")
	}
}

func main() {

	p, f := factory(pequenio, 1000)
	if f != nil {
		log.Fatal(f)
	}

	fmt.Println("Precio:", p.precio())
	fmt.Println("---")

	m, f2 := factory(mediano, 1000)
	if f2 != nil {
		log.Fatal(f2)
	}
	fmt.Println("Precio:", m.precio())
	fmt.Println("---")

	g, f3 := factory(grande, 1000)
	if f3 != nil {
		log.Fatal(f3)
	}
	fmt.Println("Precio:", g.precio())
	fmt.Println("---")

	r, f4 := factory("random", 1000)
	if f4 != nil {
		log.Fatal(f4)
	}
	fmt.Println("Precio:", r.precio())
}
