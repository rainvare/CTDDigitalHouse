import React from "react";
import { Icon } from "./SearchBlockStyled";
import {  InputContainer, Input } from "./SearchInputStyled";

export default function SearchInput({icon, input}) {
    return(
      <InputContainer>
        <Icon>
          {icon}
        </Icon>
        <Input>
          {input}
        </Input>
      </InputContainer> 
    );
  }