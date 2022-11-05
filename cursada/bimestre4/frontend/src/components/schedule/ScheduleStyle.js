import styled from "styled-components";
import { theme } from '../../ui/theme'
import "react-datepicker/dist/react-datepicker.css";

export const GlobalStyle = styled.div`
  background: ${props => props.isInProductPage ? "rgb(236, 236, 236)" : "#fff"};
    position: "relative";
    color: "#0073A3";
    display:  ${props => props.isInProductPage ? "flex" : ""};
    justify-content:  ${props => props.isInProductPage ? "space-evenly" : ""};
    align-items:  ${props => props.isInProductPage ? "center" : ""};
    padding:  ${props => props.isInProductPage? "2rem" : "0"};
    width:100%; 
    
    @media (max-width: 768px){
      display:flex;
      flex-direction:column;
    }

`

export const ScheduleMainStyled = styled.div`
  background: white;
  font-size: 0.8rem;
  display: flex;
  width: 100%;
  box-shadow: ${props => props.isInProductPage ? "0px 2px 5px 0px rgba(0, 0, 0, 0.16)" : ""};
  padding: ${props => props.isInProductPage ? "1rem" : "0px"};
  border-radius: ${props => props.isInProductPage ? "5px" : "0px"};
  margin:${props => props.isInProductPage ? "20px" : "0px"};
  @media (max-width:768px){
    margin: 20px 0;
  }
`;

export const ButtonScheduleStyled = styled.div`
  width: 100%;
  height: 100%;
  padding: 0.5em;
  display: flex;
  justify-content: center;
  align-items: center;
`;

export const ScheduleIngresarReservaDiv = styled.div`
  border-radius: 10px;
  box-shadow: 0px 2px 5px 0px rgba(0, 0, 0, 0.16);
  height: 100%;
  display: flex;
  padding: 1rem;
  flex-direction: column;
  align-items: center;
  background-color: #fff;
  margin:auto;
  width:100%;
  p{
    color: ${theme.text_primary};
    padding: 1rem;
    font-weight: bold;
  }
`;
