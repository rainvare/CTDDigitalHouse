import React from 'react'
import styled from 'styled-components'

const ErrorMessage = ({ children, visible }) => {
    return (
        <StyledErrorMessage visible={visible}>
            {children}
        </StyledErrorMessage>
    )
}

export default ErrorMessage

const StyledErrorMessage = styled.div`
    color: red;
    display: ${props => props.visible ? "inline" : "none"};
    font-weight: bold;
`