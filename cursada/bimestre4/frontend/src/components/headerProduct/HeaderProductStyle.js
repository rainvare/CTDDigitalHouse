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
  padding: 15px 20px 15px 30px;
  
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
          font-size: 17px;  
          font-weight:300;
          padding-bottom:5px;
      }

      h2{
          font-size: 28px;
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