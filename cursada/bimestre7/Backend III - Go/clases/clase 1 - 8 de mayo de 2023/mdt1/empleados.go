package main

import (
    "fmt"
)

func main() {

    var employees = map[string]int{"Benjamin": 20, "Nahuel": 26, "Brenda": 19, "Darío": 44, "Pedro": 30}

    fmt.Println("La edad de Benjamin es:", employees["Benjamin"])

    sum := 0

    for _, v := range employees {
        if v > 21  {
            sum++
        }
    }

    fmt.Println("La cantidade alumnos ayor a 21 son: ", sum)

    employees["Federico"] = 25

    fmt.Println(employees["Federico"])

    delete(employees, "Pedro")

    fmt.Println(employees)
}