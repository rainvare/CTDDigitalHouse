const products = [
    {id: 1, name: "Tshirt", isStock: false},
    {id: 2, name: "Pants", isStock: false},
    {id: 3, name: "Shorts", isStock: true},
    {id: 4, name: "Shoes", isStock: false},
    {id: 5, name: "Bracelets", isStock: true},
    
]

const displayProducts = (argument)=>{
    if(argument === 1){
        return(
            <ul>
            <span>All Products</span>
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
            <span>Products in Stock</span>
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
    }else if(argument === 3){
        return(
            <ul>
            <span>Products out of Stock</span>
           {
               products.map(product =>{
                if(!product.isStock){
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

//cada función debe retornar un elemento
const App = (
    <div>
       {
           displayProducts(1)
       }
       {
           displayProducts(2)
       }
       {
           displayProducts(3)
       }
    </div>
)

const hookedElement = document.getElementById("root");
ReactDOM.render(App, hookedElement)