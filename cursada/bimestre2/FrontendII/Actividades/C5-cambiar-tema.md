# Ejercitacion - Clase 5

## Cambiar tema

`index.html`

```html
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles.css">
  <title>Clase 5</title>
</head>

<body class="dark">

  <h1>La familia de los felinos</h1>

  <div class="contenedor">
    <div class="item">
      <img src="./imagenes/tiger.jpg">
      <h2>El tigre</h2>
      <p>
        El tigre (Panthera tigris) es una de las especies​ de la subfamilia de los panterinos (familia Felidae)
        pertenecientes al género Panthera. Se encuentra solamente en el continente asiático; es un predador carnívoro y
        es
        la especie de félido más grande del mundo junto con el león pudiendo alcanzar ambos un tamaño comparable al de
        los
        fósiles de félidos de mayor tamaño.
      </p>
    </div>
    <div class="item">
      <img src="./imagenes/leon.jpg">
      <h2>El leon</h2>
      <p>
        El león (Panthera leo) es un mamífero carnívoro de la familia de los félidos y una de las cinco especies del
        género Panthera. Los leones salvajes viven en poblaciones cada vez más dispersas y fragmentadas del África
        subsahariana (a excepción de las regiones selváticas de la costa del Atlántico y la cuenca del Congo) y una
        pequeña zona del noroeste de India
      </p>
    </div>
    <div class="item">
      <img src="./imagenes/leopardo.jpg">
      <h2>El leopardo</h2>
      <p>
        El leopardo (Panthera pardus) es un mamífero carnívoro de familia de los félidos. Al igual que tres de los demás
        félidos del género Panthera: el león, el tigre y el jaguar, están caracterizados por una modificación en el
        hueso hioides que les permite rugir. También se lo conoce como pantera parda y, cuando presenta un pelaje
        completamente oscuro como pantera negra (melánico).
      </p>
    </div>
    <div class="item">
      <img src="./imagenes/pantera-negra.jpg">
      <h2>La pantera negra</h2>
      <p>
        La pantera negra es una variación negra (melanismo) de varias especies de grandes félidos, en especial del
        leopardo (Panthera pardus) y del jaguar (Panthera onca). Pero cabe recalcar que no es una nueva especie, ni
        siquiera una subespecie, es simplemente una variación negra de estos animales.
      </p>
    </div>
    <div class="item">
      <img src="./imagenes/jaguar.jpg">
      <h2>El jaguar</h2>
      <p>
        El jaguar, yaguar o yaguareté (Panthera onca) es un carnívoro félido de la subfamilia de los Panterinos y
        género Panthera. Es la única de las cinco especies actuales de este género que se encuentra en América. También
        es el mayor félido de América y el tercero del mundo, después del tigre (Panthera tigris) y el león (Panthera
        leo).
      </p>
    </div>
    <div class="item">
      <img src="./imagenes/chita.jpg">
      <h2>El guepardo</h2>
      <p>
        El guepardo o chita (Acinonyx jubatus)1​ es un miembro atípico de la familia de los félidos. Es el único
        representante vivo del género Acinonyx. Caza gracias a su vista y a su gran velocidad. Es el animal terrestre
        más veloz, ya que alcanza una velocidad punta de 115 km/h en carreras de hasta cuatrocientos o quinientos
        metros.
      </p>
    </div>
  </div>

  <script src="./js/index.js"></script>

</body>

</html>
```

`index.js`

```js
let temaOscuro = confirm("Queres cambiar la pagina a modo oscuro?");

if(temaOscuro) {
  document.querySelector('body').classList.add('bodyOscuro');
  document.querySelector('h1').classList.add('tituloOscuro');
  document.querySelectorAll('div.item').forEach(element => element.classList.add('itemsOscuro'));
}
```

`styles.css`

```css
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap');

* {
  margin: 0;
  padding: 0;
  font-family: 'Open Sans', sans-serif;
}

body {
  background-color: rgb(219, 219, 219);
}

h1 {
  padding: .5em 1em;
  background-color: white;
  border-bottom: 1px solid lightgrey;
  color: grey;
}

.contenedor {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  width: 80%;
  margin: 2em 10%;
}

.item {
  width: 30em;
  background-color: white;
  box-sizing: border-box;
  padding: 1.5em;
  margin-bottom: 1em;
  border-radius: 5px;
  border: 1px solid lightgray;
}

.item img {
  width: 100%;
}

.item h2 {
  font-size: 1em;
  margin-bottom: .2em;
}


/* estilos para tema oscuro ---------------------------------------------------------------------------------------------- */
/* los suigientes estilos son los que usaremos para aplicar el modo oscuro, ustedes deberán modificar los selectores para
poder resolver el ejercicio */


/*  el color de fondo  */
.bodyOscuro {
  background-color: rgb(39, 39, 39);
}

/* las modificaciones al titulo 'la familia de los felinos */
.tituloOscuro { 
  background-color: rgb(19, 19, 19);
  color: rgb(170, 170, 170);
  border-color: black;
}

/* las modificaciones a los items */
.itemsOscuro{
  background-color: rgb(19, 19, 19);
  border-color: black;
  color: rgb(230, 230, 230);
}
```

## [⏪ Atrás](../README.md)