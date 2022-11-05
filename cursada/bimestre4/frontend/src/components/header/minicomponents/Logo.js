import React from 'react'
import logo from '../../../ui/wespedlogo.jpeg'
import styled from 'styled-components'

const Logo = () => {
  return (
    <Image src={logo} alt='Logo Digital Booking' />
  )
}

export default Logo

const Image = styled.img`
 margin: 1rem;
 height: 3.7rem;
 border-radius: .5rem;
 `
