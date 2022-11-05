import React from 'react'
import { CardStyles } from './CardStyles'

export default function Card({children}) {
  return (
    <CardStyles>
       {children}
    </CardStyles>
  )
}
