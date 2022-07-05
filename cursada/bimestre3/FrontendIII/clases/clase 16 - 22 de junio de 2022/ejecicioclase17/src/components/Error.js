import React from 'react'
import GoTo from "./GoTo";

const Error = () => {
  return (
    <div>
    <h1>404</h1>
    <p>Te perdiste?</p>
    <button>
    <GoTo
              argumentOne={"Volver a Home"}
              argumentTwo={"/home"}
            />
    </button>
    </div>
  )
}

export default Error