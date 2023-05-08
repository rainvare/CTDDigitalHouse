package main

import (
	"fmt"
	"sort"
)

const (
	minimum = "minimum"
	average = "average"
	maximum = "maximum"
 )

func main() {


	minFunc, err := operation(minimum)
	if err != nil {
		panic(err)
	}

	averageFunc, err := operation(average)
	if err != nil {
		panic(err)
	}

	maxFunc, err := operation(maximum)
	if err != nil {
		panic(err)
	}

	minValue := minFunc(2, 3, 3, 4, 10, 2, 4, 5)
	averageValue := averageFunc(2, 3, 3, 4, 1, 2, 4, 5)
	maxValue := maxFunc(2, 3, 3, 4, 1, 2, 4, 5)

	fmt.Println("Valor minimo:", minValue)
	fmt.Println("Valor medio:", averageValue)
	fmt.Println("Valor maximo:", maxValue)



}

type calcCallback func(int, int) int

func Calc(parameter calcCallback, numbers ...int) int {
	value := numbers[0]
	for _, v := range numbers {
		value = parameter(v, value)
	}
	return value
}


func operation(op string, i ...int) int {
	switch op {
	case minimum:
		return Calc(func (initialValue int, finalValue int) {
			if initialValue < finalValue {
				return initialValue
			}
			return finalValue
		}, i...)
	return 1
}




func minCalc(i ...int) int {
	min := i[0]
	for _, v := range i {
		if (v < min) {
			min = v
		}
	}
	return min
}

func averageCalc(i ...int) int {
	sum := 0
	for _, v := range i {
		sum += v
	}
	return sum/len(i)
}

func maxCalc(i ...int) int {
	max := i[0]
	for _, v := range i {
		if max < v {
			max = v
		}
	}
	return max
}