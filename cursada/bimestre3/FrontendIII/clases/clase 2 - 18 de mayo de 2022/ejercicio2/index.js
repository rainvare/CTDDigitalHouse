const products = [
    {id:1, name: "Tshirts", isStock:"false"},
    {id:2, name: "Pants", isStock:"false"},
    {id:3, name: "Shorts", isStock:"false"},
    {id:4, name: "shoes", isStock:"true"},
    {id:5, name: "Bracelets", isStock:"false"}
]
/*Ingreso de elementos Harcode
'-------------------------------
const liFirst = React.createElement(
    "li",
    {key:1},
    `${products[0].name}`
    )

const liSecond = React.createElement(
        "li",
        {key:1},
        `${products[1].name}`
        )
const liThird = React.createElement(
            "li",
            {key:1},
            `${products[2].name}`
            )
const ul = React.createElement(
    "ul",
    null[liFirst,liSecond,liThird]
)
'-------------------------------------
//componente app manual
const App= (
    <div>
        <ul>
            <li>{products[1].name}</li>
            <li>{products[2].name}</li>
            <li>{products[3].name}</li>
            <li>{products[4].name}</li>
            <li>{products[5].name}</li>
        </ul>
    </div>
)
'--------------------------------------
//map para ingresar datos a App
const App= (
    <div>
        <ul>
            {
                products.map((products)=> {
                    <li key={products.id}>{products.name}</li>
                })
            }
        </ul>
    </div>
)

*/
const displayProducts=(argument){
    if(argument === 1){
        return(<li key={products.id}>{products.name}</li>
        )
    } else if(argument ===2){
        return{
            <ul>
            <span>All products</span>
            {
                products.map((products)=> {
                   if(products.isStock){
                       return (
                        <li key={products.id}>{products.name}</li>
                       )
                   }
            </ul>
                }
    }
}
}else if(argument ===0){
    return{
        <ul>
        <span>products off stock/span>
        {
            products.map((products)=> {
               if(products.isStock){
                   return (

                   )
               }
        </ul>

}
        }



//map para ingresar datos a App
const App= (
    <div>
        {
           displayProducts(1)
           },
             {
           displayProducts(2)
           },
             {
           displayProducts(3)
           },

    </div>
)

// creo el hooked
const hookedElement= document.getElementById("root")


// renderizo
ReactDOM.render(ul,hookedElement)