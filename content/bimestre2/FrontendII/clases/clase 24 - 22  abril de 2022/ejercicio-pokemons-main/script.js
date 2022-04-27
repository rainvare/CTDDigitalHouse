async function fillPokemonData(name, order) {
  //NO TOCAR - ESTA VARIABLE CONTIENE LA INFORMACIÓN SOBRE LOS POKEMONS,
  // QUE USARÁS PARA COMPLETAR LAS ACTIVIDADES
  const pokemonData = await getPokemonData(name);

  //Actividades

  // 1) Insertar la imagen del pokemon dentro cada card. Para ello,
  // puedes explorar los elementos HTML utilizando las Dev Tools de tu
  // navegador."https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png"
  const imagenPokemon = document.querySelector(`#imagen-pokemon-${order}`);
  imagenPokemon.setAttribute("src", pokemonData.imagen);
  // 2) Utilizando los stats de cada pokemon, deberás rellenar cada una de las
  // barras que figuran en la card. Dependiendo de la cantidad de cada atributo
  // tendrás que decidir el color que tendrá la barra en cada caso:
  // Si la habilidad es menor a 35, la barra será de color rojo
  // Si la habilidad es mayor o igual a 35 pero menor que 70, la barra será amarilla
  // Si la habilidad es igual o mayor a 70, la barra será de color verde.
  // Deberás utilizar las clases que se encuentran en el archivo styles.css
  const atributos = ["hp", "ataque", "defensa", "velocidad"];

  atributos.forEach((atributo, index) => {
    const barra = document.querySelector(`#barra-${atributo}-${order}`);
    
    const valor = pokemonData.stats[index].amount;
    barra.style.width = `${valor}%`;
    
    if (valor<35){
      barra.classList.toggle('rojo');
    }else if(valor<70){
      barra.classList.toggle('amarillo')
    }else if (valor>=70){
      barra.classList.toggle('verde');
    }
  })

  //ESCRIBE TU CÓDIGO A CONTINUACIÓN DENTRO DE LA FUNCIÓN:
}

//LISTADO DE POKEMONS - PUEDES CAMBIAR POR TU FAVORITO!
const pokemons = ["pikachu", "bulbasaur", "charmander", "diglett", "charizard", "bunnelby"];

//INICIALIZADOR - NO TOCAR
setTimeout(() => {
  const contenedorSpinner = document.querySelector("#contenedor-carga");
  pokemons.forEach((pokemon, index) => {
    contenedorSpinner.style.display = "none";
    const pokemonNumber = index + 1;
    createPokemonCard(pokemon, pokemonNumber);
    fillPokemonData(pokemon, pokemonNumber);
  });
},3500);

function agregar(){
  const nuevoPokemon = prompt("Ingresa el nombre del pokemón todo en minúscula");
  pokemons.push(nuevoPokemon);

  createPokemonCard(nuevoPokemon, pokemons.length);
  fillPokemonData(nuevoPokemon, pokemons.length);
}