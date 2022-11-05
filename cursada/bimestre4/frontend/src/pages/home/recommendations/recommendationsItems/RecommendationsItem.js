import React from 'react'
import { ItemRecommendationStyle, ImageRecommendationStyle, InfoRecommendationsStyle, CategoryStyle, TitleStyle, LocationTextStyle, DescriptionStyle, ImageWrapperStyle, LinkStyle, IconStyle } from './RecommendationsItemStyle'
import { HiLocationMarker } from 'react-icons/hi'
import Card from '../../../../components/card/Card'
import Button from '../../../../components/button/Button'
import { Icons } from '../../../../ui/icons';



export default function RecommendationsItem({ id, images, category, title, city, description, features }) {
    return (
        <Card>
            <ItemRecommendationStyle >
                <ImageWrapperStyle>
                    <ImageRecommendationStyle src={images.sort((lhs, rhs) => lhs.id - rhs.id)[0].urlImage} alt="img" />
                </ImageWrapperStyle>
                <InfoRecommendationsStyle>
                    <CategoryStyle>{category.title}</CategoryStyle>
                    <TitleStyle>{title}</TitleStyle>
                    <LocationTextStyle><HiLocationMarker />{" " + city.name + ", " + city.country}</LocationTextStyle>
                    <IconStyle>
                        {features.map(item => (
                            <p key={item.id}>{Icons[item.icon]}</p>
                        ))}

                    </IconStyle>
                    <DescriptionStyle>{description}</DescriptionStyle>
                    <LinkStyle to={`/producto/${id}`} tabIndex='-1'><Button width="100%">Ver detalle</Button></LinkStyle>

                </InfoRecommendationsStyle>
            </ItemRecommendationStyle>
        </Card>
    )
}
