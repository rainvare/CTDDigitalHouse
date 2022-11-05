import React from 'react'
import { BurgerButton } from './StyledBurgerMenu'

const BurgerMenu = (props) => {
    return (
        <BurgerButton>
            <div onClick={props.handleClick} className={`icon nav-icon-5 ${props.clicked ? "open" : ""}`}>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </BurgerButton>
    )
}

export default BurgerMenu