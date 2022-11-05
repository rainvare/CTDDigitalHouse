import styled from "styled-components";

export const SelectStyled = styled.div`
  width: 100%;
  height: 100%;
  padding-left: 1em;
  color: #eeee;
  border: none;
  

  &:focus {
    outline: none;
  }
  & p {
    color: #545776;
    width: 100%;
    height: 100%;
    padding: 0.45em 0;
    font-size: 17px;
  }
`;

export const ContainerStyled = styled.div`
  z-index: 123123213;
  background: #ffffff;
  display: ${({ displayList }) => displayList};
  color: #545776;
  width: 100%;
  height: auto;
  position: absolute;
  left: 0;
  top: 3em;
  box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.15);
  border-radius: 5px;
  padding-bottom: 0.5em;

  @media all and (max-width: 768px) {
    width: 100%;
  }
  .option {
    position: relative;
    z-index: 213123;
  }
`;


export const OptionStyled = styled.div`
  display: flex;
  position: relative;
  cursor: pointer;

  & div {
    display: flex;
    flex-direction: column;
    padding: 1.2em;
  }
  & div.city-container {
    flex: 1;
    display: flex;
    flex-direction: row;
    z-index: -1;
  }
  & p {
    margin-left: 5px;
  }
  & div.icon {
    justify-content: center;
    align-items: center;
  }
  ::after {
    position: absolute;
    bottom: 0;
    left: 2.5%;
    content: "";
    width: 95%;
    height: 0.2em;
    border-radius: 0.5em;
    background: ${props => (props.theme.secondary)};
  }
`;