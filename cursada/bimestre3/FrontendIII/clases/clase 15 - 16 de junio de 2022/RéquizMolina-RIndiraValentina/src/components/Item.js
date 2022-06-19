import React ,{ useState } from "react"
// El componente Item no tiene componentes hijos.
// ESTADO: Item debe tener un número para almacenar la cantidad de stock, la misma se la defina el padre a la hora de crearlo.
// PROPS: Item recibe todos los campos que muestra en pantalla: nombre, descripcion, stock y el métodos heredados para su uso.
const Item = ({name, description, stock, total}) => {
const [units, setUnits]= useState(stock);
// MÉTODOS: Item debe manejar el click de su boton para restar la cantidad en stock de sí mismo y a su vez poder aumentar el estado de su "abuelo" App.
const added = () =>{
  setUnits(units -1);
  total();
}
// Maqueta de Item:
//    h3
//    p
//    h5 > span    (este span debe mostrar la cantidad si es mayor a 0 "agotado" si llega a 0)
//    button       (este boton debe permitir comprar, pero si la cantidad es menor a 0 debe estar deshabilitado y decir "Sin stock")
  return (
    <div className='producto'>
       
        <h3>{name}</h3>
        <p>{description}</p>
        <h5><span>{units < 1 ? "Agotado" : units}</span></h5>
        <button 
        disabled = {units < 1} 
        onClick ={()=> {
          added()
          }}>
        {units <= 0 ? "Sin stock": "Comprar"}
        </button>
    
    </div>
  )
}
export default Item
