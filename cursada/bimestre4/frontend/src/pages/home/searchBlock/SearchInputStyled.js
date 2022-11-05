//inputs
import styled from 'styled-components';

export const InputContainer = styled.div`
  position: relative;
  max-width: 420px;
  min-width: 200px;
  height: 40px;
  background: #FFFFFF;
  color: #DFE4EA;
  display: flex;
  justify-content: space-between;
  border-radius: 5px;

  @media (max-width: 760px) {
    max-width: 100%;
    min-width: 100%;

  }

`;


export const Input = styled.div`
  width: 422px;
  height: 40px;
  border: none;
  margin-right: 20px;
  padding-block-start: 4px;
  
  @media all and (max-width:760px){
    width:100%;
    margin-left:10px;
  }

  @media(max-width:414px){
    max-width:393px;
  }

`;