import styled from "styled-components";

export const CategoryContainerStyle = styled.section`
  min-width: calc(320px - 4rem);
  max-width: 1366px;
  margin: 0 auto;
  background: #F3F1ED;
  padding: 240px 32px 0px 32px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  
  @media (max-width:768px) {
    padding-top: 20px;
  }

`
export const TitleStyle = styled.h2`
font-weight: 600;
font-size: 25px;
line-height: 28px;
color: #383B58;
margin-bottom: 20px;

@media (max-width: 414px) {
  font-size:21px
}
`

export const CategoryListContainerStyle = styled.div`
    display: flex;
    gap: 14px;
    flex-flow: row nowrap;
  
    @media (max-width: 414px) {
      display: flex;
      flex-direction: column;
      width: 100%;
    }

    @media (min-width: 415px) and (max-width: 930px) {
      display: flex;
    gap: 14px;
      flex-flow: row wrap;
       align-items: stretch;
    }
`

export const CardStyle = styled.div`
width: 100%;
cursor:pointer;

transition: transform 500ms ease;
&:hover {
  transform: scale(1.05);
}

@media (min-width: 415px) and (max-width: 930px) {
    width: calc(50% - 7px)
}
`








  
  

 

 


