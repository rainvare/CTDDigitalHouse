import React from 'react'
import { SectionStyle } from './SectionStyle'

export default function Section({children}) {
  return (
    <SectionStyle>{children}</SectionStyle>
  )
}
