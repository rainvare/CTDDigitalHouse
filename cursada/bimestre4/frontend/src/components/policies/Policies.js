import React from 'react'
import { PoliciesStyle } from './PoliciesStyle'


export default function Policies({product}) {
    return (
            <PoliciesStyle>
                {product.policies.map(item => (
                    <div key={item.id}>
                        <h4>{item.title}</h4>
                        <p>{item.description}</p>
                    </div>
                ))}
            </PoliciesStyle>
    )
}
