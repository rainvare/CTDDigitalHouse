package main

import (
	"fmt"
)

func main() {
	nombres := []string{"Benjamin", "Nahuel", "Brenda", "Marcos", "Pedro", "Axel", "Alez", "Dolores", "Federico", "Hernán", "Leandro", "Eduardo", "Duvraschka"}
	fmt.Println(nombres)
	nombres = append(nombres, "Gabriela")
	fmt.Println(nombres)
}