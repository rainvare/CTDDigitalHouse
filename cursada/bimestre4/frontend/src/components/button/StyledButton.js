import styled from "styled-components";

export const StyledButton = styled.button`
  border-radius: 5px;
  color: #1dbeb4;
  padding: 10px;
  width: ${(props) => props.width};
  cursor: pointer;
  ${(props) =>
        props.theme === "primary"
            ? `background-color: #fff;
   height: 2.5rem;
   font-size: 1rem;
   font-family: 'Roboto', sans-serif;
   border: 1px solid #1dbeb4;
   &:hover {
   background-color: #1dbeb4;
   color: #fff;
   }
   &:active {
   background-color: #37d3c9;
   }`
            : `background-color: #1dbeb4;
   color: #fff;
   border: none;
   height: 2.5rem;
   font-size: 1rem;
   font-family: 'Roboto', sans-serif;
   box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.15);
   &:hover {
    background-color: #32d3c8;
    color: #fff;
  }
  &:active {
    background-color: #44ddd3;
  }
  `}
`;