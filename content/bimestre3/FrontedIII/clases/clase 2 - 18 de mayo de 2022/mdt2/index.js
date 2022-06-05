// Array de elemento o DATA

const products = [
    {id: 1, name: "Ajo", isStock: true},
    {id: 2, name: "Papa", isStock: false},
    {id: 3, name: "Zanahoria", isStock: true},
    {id: 4, name: "Tomate", isStock: true},
    {id: 5, name: "Cebolla", isStock: false},
    
]


// itero los elementos para crear dos headers don un título y una lista cada uno
const displayProducts = (argument)=>{


    if(argument === 1){
        return(
           <header> 
            <h1>Productos de nuestra verdurería</h1>
            <ul>
           {
               products.map((product)=>{
                   return (
                       <li key={product.id}>{product.name}</li>
                   )
               })
           }
       </ul>
       </header>
        )

    }else if (argument === 2){
        return(
            <header>
            <h2>Productos disponibles</h2>
            <ul>
           {
               products.map(product =>{
                if(product.isStock){
                    return (
                        <li key={product.id}>{product.name}</li>
                    )
                }
               })
           }
       </ul>
       </header>
        )
    }
        
    
}

//guardo mis componentes en App
const App = (
    <div>
       {
           displayProducts(1)
       }
       {
           displayProducts(2)
       }

    </div>
)

//creo mi hook
const hookedElement = document.getElementById("root");

//renderizo
ReactDOM.render(App, hookedElement)