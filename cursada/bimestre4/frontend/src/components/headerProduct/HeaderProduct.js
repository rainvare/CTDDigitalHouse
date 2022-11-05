import React from 'react';
import { BoxHeaderStyle,HeaderStyle, Title, LinkStyle, Arrow} from './HeaderProductStyle';
import {FaChevronLeft } from "react-icons/fa";

export default function HeaderProduct({product, to}) {
  return (
  
          <BoxHeaderStyle>
          <HeaderStyle>
            <Title>
              <h4>{product.title}</h4>
              <h2>{product.category.title}</h2>
            </Title>
            <Arrow>
              <LinkStyle to={to}>
                <FaChevronLeft />
              </LinkStyle>
            </Arrow>
          </HeaderStyle>
          </BoxHeaderStyle>
    
  )
}
