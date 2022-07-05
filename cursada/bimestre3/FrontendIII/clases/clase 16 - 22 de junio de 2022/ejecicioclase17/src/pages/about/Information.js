import React from 'react';
import Header from '../../components/Header'
import Avatar from "../../components/Avatar";
import {data} from "../../components/Data";

const Information = () =>{
    return(
        <div>
        <Header/>
        <Avatar/>
        <article>
            <h3>Personal Information</h3>
            <ul>
                <p>Name: {data.name}</p>                       
                <p>Lastname: {data.lastname}</p>                       
                <p>Age: {data.age}</p>                       
                <p>Nationality: {data.nationality}</p>                      
            </ul>
        <br/>
        </article>
        </div>
    )
}

export default Information;