import styled from "styled-components";
import { Link } from "react-router-dom";

export const BodyStyle = styled.section`
  padding-top:81px;
  height:${props => props.isOpen ? "100vh" : "auto"};
  overflow-y:${props => props.isOpen ? "hidden" : "auto"};

`
export const BoxHeaderStyle = styled.section`
height:80px;
  background-color:${props => props.theme.secondary};
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
`

export const HeaderStyle = styled.div`
  color: #fff;
  padding: 15px 30px;
  
  display:flex;
  justify-content: space-between;
  align-items: center;
  max-width: 1366px;
 margin: 0 auto;
 
`

export const Title = styled.div`
    display:flex;
    flex-direction:column;
    
      h4{
          font-size: 16px;  
          font-weight:300;
          padding-bottom:5px;
      }

      h2{
          font-size: 25px;
          line-height: 28px;
      }

      @media (max-width:426px){
        h4{
          font-size: 15px;  
          font-weight:300;
          padding-bottom:5px;
      }

      h2{
          font-size: 20px;
          line-height: 28px;
      }
      }
`;

export const Arrow = styled.div`
  font-size: 30px;
`
export const LinkStyle = styled(Link)`
  color: #fff;
  cursor:pointer;
`


export const ShareStyle = styled.div`
  height:60px;
  padding: 20px 0 20px 30px;
  display:flex;
  font-size:20px;
  div{
    padding-right:10px;
  }
`;

export const DescriptionStyle = styled.div`
  padding: 30px 30px 30px 30px;
  display:flex;
  flex-direction: column;
  h4{
    font-size:24px;
    padding-bottom:20px;
  }
  p{
    color: ${props => props.theme.text_secondary}
  }

  @media (max-width: 768px){
    padding: 20px; 30px 10px 30px;
  }
`;

export const FeaturesStyle = styled.div`
  padding: 40px 30px 30px 30px;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr ;
  gap:20px;
  align-items: center;
  justify-items: start;

  div{
    display:flex;
    align-items:center;
  }
  

  span{
    color:${props => (props.theme.primary)};
    font-size: 24px;
    padding-right:15px;

  }

  @media (max-width: 768px){
    grid-template-columns: 1fr 1fr ;
  }
`

export const PoliciesStyle = styled.div`
  padding: 40px 30px 80px 30px;
  display:grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap:30px;
  align-items: center;
  justify-items: start;
  p{
    color: ${props => props.theme.text_secondary}
  }

  @media (max-width: 768px){
    grid-template-columns: 1fr 1fr ;
    gap:40px;
  }
`


export const LineStyles = styled.hr`
  border-color:${props => props.theme.primary};
`
export const TitleStyles = styled.h4`
  padding: 20px 0 12px 30px;
  font-size:24px;

  
`
