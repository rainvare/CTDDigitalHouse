package main

import (
	"errors"
	"fmt"
	"log"
)

type Producto struct {
	Id        int
	Nombre    string
	Precio    float32
	Categoria string
}

type Prods interface {
	listar()
	guardar(p Producto)
}

var p1 = Producto{
	1,
	"primer producto",
	2.5,
	"una categoria",
}

var p2 = Producto{
	2,
	"segundo producto",
	2.5,
	"una categoria",
}

var p3 = Producto{
	3,
	"tercer producto",
	2.5,
	"una categoria",
}

var p4 = Producto{
	4,
	"cuarto producto",
	7.8,
	"una categoria",
}

type Productos []Producto

var ListadoProductos = Productos{
	p1,
	p2,
	p3,
}

func (p Productos) listar() {
	for _, v := range p {
		fmt.Println(v)
	}
}

func (p *Productos) guardar(a Producto) {
	*p = append(*p, a)
}

func (p Producto) guardar() {
	ListadoProductos = append(ListadoProductos, p)
}

func (p Productos) buscarPorId(id int) (Producto, error) {
	for _, v := range p {
		if v.Id == id {
			return v, nil
		}
	}
	return Producto{}, errors.New("No se encuentra el producto especificado")
}

func main() {

	ListadoProductos.listar()
	ListadoProductos.guardar(p4)
	fmt.Println("---------------------")
	ListadoProductos.listar()
	encontrarProducto, e := ListadoProductos.buscarPorId(9)
	if e != nil {
		log.Fatal(e)
	}
	fmt.Println("---------------------")
	fmt.Println(encontrarProducto)

	var list []interface{}
	list = append(list, 1)        // 0
	list = append(list, p1)       // 1
	list = append(list, "string") // 2
	list = append(list, true)     // 3

	a, ok := list[2].(string)
	if !ok {
		log.Fatal("error type assertion")
	}
	println(a)

}
