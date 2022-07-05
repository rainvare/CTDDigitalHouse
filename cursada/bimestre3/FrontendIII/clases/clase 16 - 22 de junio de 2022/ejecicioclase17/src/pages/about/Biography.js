import React from 'react';
import Header from '../../components/Header'
import Avatar from "../../components/Avatar";
import {data} from "../../components/Data";

const Biography =()=>{
    return(
        <div>
        <Header />
        <Avatar />
        <article>
            <h3>Biography:</h3>
            <p>{data.bio}</p>
        </article>
        </div>
    )
}
export default Biography;