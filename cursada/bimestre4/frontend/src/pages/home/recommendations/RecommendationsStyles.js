import styled from "styled-components"

export const RecommendationContainerStyle = styled.section`
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  margin: 0 auto;
  max-width: 1366px;
  padding: 20px 32px 100px 32px;

  @media (max-width: 414px) {
    background-color:${props => props.theme.secondary};
    padding: 10px 20px 76px 20px;
    margin-top:20px;
  }

`
export const RecomendationTitle = styled.h2`
  font-weight: 600;
  font-size: 24px;
  margin-bottom: 20px;
  color: #383B58;

  @media (max-width: 414px) {
    color:#ffffff;
    font-size:24px;
  }

`
export const ListRecommendationsStyle = styled.div`
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  gap: 30px;

  @media (max-width: 414px) {
    display: flex;
    flex-direction: column;

  }

  @media (min-width: 415px) and (max-width: 768px){
    display: flex;
    flex-direction: column;
  }

  @media (min-width: 769px) {
    flex-direction: row;
  } 

`

export const CardStyle = styled.div`
@media (min-width: 1265px) {
  width: calc(50% - 15px)
  
}
`








  

