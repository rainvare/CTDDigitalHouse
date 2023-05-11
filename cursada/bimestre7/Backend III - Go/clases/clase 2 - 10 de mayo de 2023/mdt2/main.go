package main

import (
	"errors"
	"fmt"
	"log"
)

func main() {
	horas := [5]float32{80, 60, 45, 10, 0}
	categorias := [5]string{"A", "C", "B", "z", "A"}

	for i := 0; i < len(horas); i++ {
		salario, categoria, err := calcularSalario(horas[i], categorias[i])
		if err != nil {
			log.Fatal(err)
		}
		fmt.Println("Salario: ", salario, " \nCategoria: ", categoria)
	}

}

func calcularSalario(horas float32, categoria string) (float32, string, error) {
	if horas == 0 {
		return 0, categoria, errors.New("Las horas deben ser mayores a 0")
	}

	switch categoria {
	case "A":
		return (horas * 3000) * 1.5, categoria, nil
	case "B":
		return (horas * 1500) * 1.2, categoria, nil
	case "C":
		return horas * 1000, categoria, nil
	default:
		return 0, categoria, errors.New("Categoria no valida")
	}

}

/* Una empresa marinera necesita calcular el salario de sus empleados basándose
en la cantidad de horas trabajadas por mes y la categoría.
Categoría C: su salario es de $1.000 por hora.
Categoría B: su salario es de $1.500 por hora, más un 20 % de su salario mensual.
Categoría A: su salario es de $3.000 por hora, más un 50 % de su salario mensual.
Se solicita generar una función que reciba por parámetro la cantidad de minutos
trabajados por mes y la categoría, y que devuelva su salario.
*/
