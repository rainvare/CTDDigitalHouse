import React from 'react'
import { StyledLoggedIn } from './StyledLoggedIn'
import Avatar from '../avatar/Avatar'
import Greeting from '../greeting/Greeting'
import { IconContext } from 'react-icons'
import { IoCloseCircleOutline } from 'react-icons/io5'
import { useContext } from 'react'
import { UserContext } from '../../../../hooks/UseContext'
import { useNavigate } from 'react-router-dom'

const LoggedIn = () => {
    const { setLoggedUser } = useContext(UserContext)
    const navigate = useNavigate();

    const signOutHandler = () => {
        setLoggedUser(false)
        localStorage.clear()
        navigate('/')
    }
    return (
        <StyledLoggedIn>
            <Avatar />
            <Greeting />
            <IconContext.Provider value={{ size: "1.5rem", color: "#383B58" }}>
                <IoCloseCircleOutline onClick={signOutHandler} />
            </IconContext.Provider>
        </StyledLoggedIn>
    )
}

export default LoggedIn