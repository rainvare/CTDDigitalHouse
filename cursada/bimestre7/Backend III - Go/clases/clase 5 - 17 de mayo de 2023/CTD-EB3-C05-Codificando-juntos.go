package main

import (
	"fmt"
)

type Autor struct {
	Nombre   string
	Apellido string
}

func (a *Autor) nombreCompleto() string {
	return fmt.Sprintf("%s %s", a.Nombre, a.Apellido)
}

type Libro struct {
	Titulo    string
	Contenido string
	Autor     Autor
}

func (b *Libro) informacion() {
	fmt.Println("Titulo: ", b.Titulo)
	fmt.Println("Contenido: ", b.Contenido)
	fmt.Println("Autor: ", b.Autor.nombreCompleto())

}

func main() {
	autor := Autor{
		"Juan",
		"Lopez",
	}

	libro := Libro{
		Titulo:    "Herencia en Go.",
		Contenido: "Go posee composición en lugar de herencia.",
		Autor:     autor,
	}
	libro.informacion()

	//Ejecutar con go run CTD-EB3-C05-Codificando-juntos.go
}
