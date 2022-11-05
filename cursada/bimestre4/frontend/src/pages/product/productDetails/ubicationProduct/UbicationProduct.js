import React from 'react'
import { BoxUbicationStyle, UbicationStyle } from './UbicationProductStyle'
import { FaMapMarkerAlt } from 'react-icons/fa'


export default function UbicationProduct({ product }) {
  return (
    <BoxUbicationStyle>
      <UbicationStyle>
        <FaMapMarkerAlt />
        <h4>{product.city.name + ", " + product.city.country}</h4>
      </UbicationStyle>
    </BoxUbicationStyle>


  )
}
