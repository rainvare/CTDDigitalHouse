const products = [
    {id: 1, name: "Ajo", isStock: true},
    {id: 2, name: "Papa", isStock: false},
    {id: 3, name: "Zanahoria", isStock: true},
    {id: 4, name: "Tomate", isStock: true},
    {id: 5, name: "Cebolla", isStock: false},
    
]

const displayProducts = (argument)=>{
    if(argument === 1){
        return(
            <ul>
            <h1>Productos de nuestra verdurería</h1>
           {
               products.map((product)=>{
                   return (
                       <li key={product.id}>{product.name}</li>
                   )
               })
           }
       </ul>
        )
    }else if (argument === 2){
        return(
            <ul>
            <h2>Productos disponibles</h2>
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
        )
    }
        
    
}


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

const hookedElement = document.getElementById("root");
ReactDOM.render(App, hookedElement)