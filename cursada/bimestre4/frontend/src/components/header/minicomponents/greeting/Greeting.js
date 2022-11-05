import React from 'react'
import { useContext } from 'react'
import { UserContext } from '../../../../hooks/UseContext'
import { StyledGreeting } from './StyledGreeting'

const Greeting = () => {
    const { loggedUser } = useContext(UserContext)
    return (
        <StyledGreeting>
            <p>Hola,</p>
            <p>{`${loggedUser?.name} ${loggedUser?.surname}`}</p>
        </StyledGreeting>
    )
}

export default Greeting