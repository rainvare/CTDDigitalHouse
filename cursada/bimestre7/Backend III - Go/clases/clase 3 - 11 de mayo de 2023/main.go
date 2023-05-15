package main

import "fmt"

const (
	dog       = "dog"
	cat       = "cat"
	hamster   = "hamster"
	tarantula = "tarántula"
)

// saco cuenta del alimento
func animalDog(dogs int) float64 {
	return 10 * float64(dogs)
}

func animalCat(cats int) float64 {
	return 5 * float64(cats)
}

func animalTarantula(tarantula int) float64 {
	return (150 * float64(tarantula)) / 1000
}

func animalHamster(hamster int) float64 {
	return (250 * float64(hamster)) / 1000
}

// casos por animal
func Animal(animal string) (func(int) float64, error) {
	switch animal {
	case dog:
		return animalDog, nil
	case cat:
		return animalCat, nil
	case hamster:
		return animalHamster, nil
	case tarantula:
		return animalTarantula, nil
	default:
		return nil, fmt.Errorf("No existe este animal")
	}
}

func main() {
	var count float64

	animaldog, err := Animal(dog)
	if err != nil {
		fmt.Println(err)
	} else {
		count += animaldog(32)
	}

	// count por el total de animales

	/* animalcat, err := Animal(cat)
	if err != nil {
		fmt.Println(err)
	} else {
		count += animalcat(25)
	}

	animalhamster, err := Animal(hamster)
	if err != nil{
		fmt.Println(err)
	} else {
		count += animalhamster(10)
	}

	animaltarantula, err := Animal(tarantula)
	if err != nil {
		fmt.Println(err)
	} else {
		count += animaltarantula(2)
	}
	*/
	fmt.Println("Comida necesaria para el animal: ", count, "Kg")
}
