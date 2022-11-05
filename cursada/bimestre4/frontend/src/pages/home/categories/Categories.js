import React from 'react'
//import categories from '../../../data/categories.json'
import CategoryItem from './categoryItem/CategoryItem'
import { CategoryContainerStyle, TitleStyle, CategoryListContainerStyle, CardStyle } from './CategoryStyles'
import { useState, useEffect } from 'react'
// import axios from 'axios'
import { AxiosInstance } from '../../../helpers/AxiosHelper'

export default function Categories({ setSelectedCategory, setRecommendationsTitle }) {

    const [categories, setCategories] = useState([]);

    useEffect(() => {
        AxiosInstance.get('/categories')
            .then((res) => {
                setCategories(res.data);
            })
    }, [])


    return (
        <CategoryContainerStyle>
            <TitleStyle>Buscar por tipo de alojamiento</TitleStyle>
            <CategoryListContainerStyle>
                {
                    categories.map((item) =>
                        <CardStyle key={item.id} onClick={() => {
                            setSelectedCategory(item.id)
                            setRecommendationsTitle(item.title)
                        }}>
                            <CategoryItem {...item} />
                        </CardStyle>
                    )
                }
            </CategoryListContainerStyle>
        </CategoryContainerStyle>
    )
}
