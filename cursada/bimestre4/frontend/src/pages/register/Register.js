import React from 'react'
import RegisterForm from './RegisterForm'
import classes from './register.module.css'

const Register = () => {
    return (
        <div className={classes.container}>
            <RegisterForm />
        </div>
    )
}

export default Register