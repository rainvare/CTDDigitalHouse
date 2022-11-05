import styled from "styled-components";
import { Link } from "react-router-dom";


export const ItemRecommendationStyle = styled.div`
display:flex;
flex-flow: row nowrap;
height: 100%;

@media (max-width: 414px){
    flex-direction: column;   
}

@media (min-width: 415px) and (max-width: 768px) {
  width: 100%;
  justify-content: space-between;
}
`

export const ImageWrapperStyle = styled.div`
@media (min-width: 415px) and (max-width: 768px) {
  width: calc(50% - 10px);
  flex: 1;
}
`

export const ImageRecommendationStyle = styled.img`
width:311px;
height:100%;
border-radius:8px 8px 0 0;

@media (max-width: 414px) {
  width: 100%;
  height: 100%;
}

@media (min-width: 415px) and (max-width: 768px) {
  object-fit: cover;
  width: 100%;
}

`;

export const InfoRecommendationsStyle = styled.div`
padding: 22px;
display: flex;
flex-direction: column;
justify-content: space-between;
flex: 1;
gap:20px;
`;

export const CategoryStyle = styled.h3`
  font-weight: 700;
  font-size: 14px;
  line-height: 18px;
  opacity: 0.5;
  text-transform: uppercase;
  color:#383B58
`;

export const TitleStyle = styled.h2`
  font-weight: 700;
  font-size: 24px;
  line-height: 28px;
  color: #383B58;
`;
export const LocationTextStyle = styled.p`
  font-weight: 500;
  font-size: 14px;
  line-height: 16px;
  color:#383B58

`
export const DescriptionStyle = styled.p`
  font-weight: 500;
  font-size: 14px;
  line-height: 16px;
  color:#383B58;
  
`

export const LinkStyle =styled(Link)`
 color:#fff;
 text-decoration: none;
`
;

export const IconStyle = styled.div`
display:flex;
font-size: 16px;


p{
  padding-right:10px;
  color:${props => (props.theme.text_secondary)};
}
`