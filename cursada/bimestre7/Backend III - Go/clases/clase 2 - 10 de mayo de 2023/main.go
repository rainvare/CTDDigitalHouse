package main

import (
	"errors"
	"fmt"
	"log"
)

const (
	minimum = "minimum"
	average = "average"
	maximum = "maximum"
)

/*
Para esto, se solicita generar una función que indique qué tipo de cálculo se quiere realizar
(mínimo, máximo o promedio) y que devuelva otra función y un mensaje (en caso de que el cálculo no esté definido),
que se le pueda pasar una cantidad N de enteros y devuelva el cálculo que se indicó en la función anterior.
*/
func main() {
	minFunc, err := tipoCalculo(minimum)
	if err != nil {
		log.Fatal(err)
	}
	averageFunc, err := tipoCalculo(average)
	if err != nil {
		log.Fatal(err)
	}
	maxFunc, err := tipoCalculo(maximum)
	if err != nil {
		log.Fatal(err)
	}

	minValue := minFunc(2, 3, 3, 4, 10, 2, 4, 5)
	averageValue := averageFunc(2, 3, 3, 4, 1, 2, 4, 5)
	maxValue := maxFunc(2, 3, 3, 4, 1, 2, 4, 5)

	fmt.Printf("El mínimo es: %d\n", minValue)
	fmt.Printf("El máximo es: %d\n", maxValue)
	fmt.Printf("El promedio es: %d\n", averageValue)

	errFunc, err := tipoCalculo("error")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Ejecución de función: ", errFunc(123, 123, 123))
}

func tipoCalculo(tipo string) (func(...int) int, error) {
	switch tipo {
	case maximum:
		return calcularMaximo, nil
	case minimum:
		return calcularMinimo, nil
	case average:
		return calcularPromedio, nil
	default:
		return nil, errors.New("tipo de operación erronea")
	}
}

func calcularMinimo(valores ...int) int {
	min := valores[0]
	for _, val := range valores {
		if val < min {
			min = val
		}
	}

	return min
}

func calcularMaximo(valores ...int) int {
	max := 0
	for _, val := range valores {
		if val > max {
			max = val
		}
	}

	return max
}

func calcularPromedio(valores ...int) int {
	sum := 0
	for _, val := range valores {
		sum += val
	}

	return sum / len(valores)
}
