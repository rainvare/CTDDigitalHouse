import random

while True:
    
    aleatorio = random.randrange(0, 5)
    elijePc = ""
    print("1)Piedra")
    print("2)Papel")
    print("3)Tijera")
    print("4)Lagarto")
    print("5) Spock")
    print("6)Salir del Programa")
    opcion = int(input("Que eliges: "))
    
    if opcion == 1:
        eligeUsuario = "piedra"
    elif opcion == 2:
        eligeUsuario = "papel"
    elif opcion == 3:
        eligeUsuario = "tijera"
    elif opcion == 4:
        eligeUsuario = "lagarto"
    elif opcion == 5:
        eligeUsuario = "spock"
    elif opcion == 6:
        print ("Nos vemos!")
        break
    else:
        print ("Valor Invalido")
        continue
        
    print("Tu eliges: ", eligeUsuario)

    if aleatorio == 0:
        eligePc = "piedra"
    elif aleatorio == 1:
        eligePc = "papel"
    elif aleatorio == 2:
        eligePc = "tijera"
    elif aleatorio == 3:
        eligePc = "lagarto"
    elif aleatorio == 4:
        eligePc = "spock"

    print("PC eligio: ", eligePc)
    print("...")

    # Victorias Papel
    if eligePc == "piedra" and eligeUsuario == "papel":
        print("Ganaste, papel envuelve piedra")
    elif eligePc == "spock" and eligeUsuario == "papel":
        print("Ganaste, papel desautoriza spock")
    # Victorias Tijera
    elif eligePc == "papel" and eligeUsuario == "tijera": 
        print("Ganaste, tijera corta papel")
    elif eligePc == "lagarto" and eligeUsuario == "tijera":
        print("Ganaste, tijera decapita lagarto")
    # Victorias Piedra
    elif eligePc == "tijera" and eligeUsuario == "piedra": 
        print("Ganaste, piedra pisa tijera")
    elif eligePc == "lagarto" and eligeUsuario == "piedra":
        print("Ganaste, piedra aplasta lagarto")   
    # Victorias Spock 
    elif eligePc == "piedra" and eligeUsuario == "spock":
        print("Ganaste, spock vaporiza piedra")
    elif eligePc == "tijera" and eligeUsuario == "spock":
        print("Ganaste, spock rompe tijera")
    # Victorias Lagarto
    elif eligePc == "spock" and eligeUsuario == "lagarto":
        print("Ganaste, lagarto envenena spock")
    elif eligePc == "papel" and eligeUsuario == "lagarto":
        print("Ganaste, lagarto devora papel")


    
    # Derrotas Piedra    
    if eligeUsuario == "piedra" and eligePc == "papel":
        print("Perdiste, papel envuelve piedra")
    if eligeUsuario == "piedra" and eligePc == "spock":
        print("Perdiste, spock vaporiza piedra")
    # Derrotas Papel
    elif eligeUsuario == "papel" and eligePc == "tijera":
        print("Perdiste, tijera corta papel")
    elif eligeUsuario == "papel" and eligePc == "lagarto":
        print("Perdiste, lagarto devora papel")
    # Derrotas Tijera
    elif eligeUsuario == "tijera" and eligePc == "piedra":
        print("Perdiste, piedra pisa tijera")
    elif eligeUsuario == "tijera" and eligePc == "spock":
        print("Perdiste, spock rompe tijera")
    # Derrotas Spock
    elif eligeUsuario == "spock" and eligePc == "papel":
        print("Perdiste, papel desautoriza spock")
    elif eligeUsuario == "spock" and eligePc == "lagarto":
        print("Perdiste, lagarto envenena spock")
    # Derrotas Lagarto
    elif eligeUsuario == "lagarto" and eligePc == "tijera":
        print("Perdiste, tijera decapita lagarto")
    elif eligeUsuario == "lagarto" and eligePc == "piedra":
        print("Perdiste, piedra aplasta lagarto")
    # Empate
    elif eligePc == eligeUsuario:
        print("Empate")

    # Opcion Reinicio
    again = input("Jugamos de nuevo? Si/No: ")
    if 'si' in again:
        continue
    elif 'no' in again:
        print("Nos vemos!")
        break
    else:
        print("Valor Invalido")