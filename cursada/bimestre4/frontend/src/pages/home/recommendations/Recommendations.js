import React from 'react';
import { RecommendationContainerStyle, RecomendationTitle, ListRecommendationsStyle, CardStyle } from './RecommendationsStyles';
import RecommendationsItem from './recommendationsItems/RecommendationsItem';
import { useContext } from 'react';
import { UserContext } from '../../../hooks/UseContext';

export default function Recommendations({ products, title }) {

  const { loggedUser } = useContext(UserContext)

  // Si se va a utilizar en otro componente, mover funcion a carpeta Helpers
  const shuffleResults = (arrayOfProducts) => {
    let lenght = arrayOfProducts.length;
    let selectedItem;
    let randomIndex;
    // While there remain elements to shuffle…
    while (lenght) {
      // Pick a remaining element…
      randomIndex = Math.floor(Math.random() * lenght--);

      // And swap it with the current element.
      selectedItem = arrayOfProducts[lenght];
      arrayOfProducts[lenght] = arrayOfProducts[randomIndex];
      arrayOfProducts[randomIndex] = selectedItem;
    }

    return arrayOfProducts.slice(0, 6);
  };

  const productsToDisplay = loggedUser?.id === undefined ? shuffleResults(products) : products;

  return (
    <RecommendationContainerStyle>
      <RecomendationTitle>{title ? `Recomendaciones en ${title}` : "Recomendaciones"}</RecomendationTitle>
      <ListRecommendationsStyle>
        {
          productsToDisplay.map(item =>
            <CardStyle key={item.id} >
              <RecommendationsItem {...item} />
            </CardStyle>

          )
        }
      </ListRecommendationsStyle>
    </RecommendationContainerStyle>
  )
}
