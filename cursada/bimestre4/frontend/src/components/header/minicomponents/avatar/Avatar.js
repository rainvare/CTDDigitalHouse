import React, { useContext } from 'react'
import { UserContext } from '../../../../hooks/UseContext'
import { StyledAvatar } from './StyledAvatar'

const Avatar = () => {
    const { loggedUser } = useContext(UserContext)

    const initials = `${loggedUser?.name[0]}${loggedUser?.surname[0]}`

    return (
        <StyledAvatar>
            {initials?.toUpperCase()}
        </StyledAvatar>
    )
}

export default Avatar