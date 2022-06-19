import React from 'react'
import Item from './Item'
// Debemos importar el listado de objetos del archivo JSON para usarlos como array a la hora de crear cada Item.
import data from './data.json'
// El componente Listado es el padre de:
// - varios Item
// ESTADO: Listado no necesita manejar un estado.
// MÉTODOS: Listado no requiere de métodos.
// PROPS: Listado recibe el método para aumentar el estado de App y se lo pasa a cada uno de sus hijos.
const Listado = ({total})=> {

  return (
    <div className='container'>
      {
        data.map(i =>(
          <Item 
          key={i.id} 
          total={total} 
          name={i.producto.name} 
          description={i.producto.description} 
          stock={i.stock}
           />
          ))
      }

    </div>
  )
}
export default Listado;