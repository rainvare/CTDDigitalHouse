import React from "react";
import styled from "styled-components";

const Input = (props) => {
  return <StyledInput type={props.type} id={props.id} width={props.width} onChange={props.onChange} visible={props.visible} ref={props.reference} required={props.required} />;
};

export default Input;

const StyledInput = styled.input`
  width: ${(props) => props.width};
  height: 2.5rem;
  box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.15);
  border-radius: 5px;
  border: none;
  padding-inline-start: 1rem;
  ${props => props.visible ?
    `background-color: #FFE1E1;
     border: 1px solid #FF0000;`
    : ""}
`;
