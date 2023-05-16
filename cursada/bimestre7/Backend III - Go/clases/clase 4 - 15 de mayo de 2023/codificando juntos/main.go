package main

import "fmt"

type Persona struct {
	Nombre string
	Edad   int
}

func main() {
	p := Persona{
		Nombre: "Gabriel",
		Edad:   22,
	}

	p.Descripcion()
}

func (p *Persona) Descripcion() {
	fmt.Printf("%s tiene %d a~nos de edad", p.Nombre, p.Edad)
}
