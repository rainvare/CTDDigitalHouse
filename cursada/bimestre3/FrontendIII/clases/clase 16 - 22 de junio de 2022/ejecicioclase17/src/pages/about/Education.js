
import React from 'react';
import Header from '../../components/Header';
import Avatar from "../../components/Avatar";
import {data} from "../../components/Data";

const Education = ()=>{

    return(
        <div>
        <Header/>
        <Avatar/>
        <article>
            <h3>{data.title}</h3>
            <ul>                
                {data.education.info.map( item =>
                    <li key ={item.id}>
                        {item.institute}                 
                    </li>
                ) }
            </ul>
        <br/>
        </article>
        </div>
    )
}

export default Education;