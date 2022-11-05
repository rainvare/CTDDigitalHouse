import React from 'react'
import {ImageCategoryStyles, InfoCategoryStyle, TitleCategoryStyle, DescriptionCategoryStyle } from './CategoryItemStyles'
import Card from '../../../../components/card/Card'


export default function CategoryItem({ urlImage, title, description }) {
    return (
            <Card>
                    <ImageCategoryStyles>
                        <img src={urlImage} alt="imagen-categoria"/>
                    </ImageCategoryStyles>
                    <InfoCategoryStyle >
                        < TitleCategoryStyle>{title} </ TitleCategoryStyle>
                        <DescriptionCategoryStyle>{description}</DescriptionCategoryStyle>
                    </InfoCategoryStyle>     
            </Card>
       
    )
}
