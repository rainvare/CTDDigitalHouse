import React from 'react'
import { ContainerStyles, ContainerImageRight, ImageLeft, ImageRight, CardRight, CardLeft, LinkStyles, CloseModalStyle, ModalStyle} from './GalleryBlockStyles'
//import images from '../../../../data/images.json'
//import { useState } from 'react';
import "react-responsive-carousel/lib/styles/carousel.min.css";
import { Carousel } from 'react-responsive-carousel';


export default function GalleryBlock({images, openModal, closeModal, modalIsOpen}) {

    return (
        <>
            <ContainerStyles >
                <div>
                    <CardLeft>
                        <ImageLeft src={images[0].urlImage} alt="" />
                    </CardLeft>
                </div>
                <ContainerImageRight>
                    {images.slice(1, 5).map((item) => (
                        <CardRight key={item.id}>
                            <ImageRight src={item.urlImage} alt="" />
                        </CardRight>
                    ))}
                </ContainerImageRight>
                <LinkStyles onClick={openModal}>Ver más</LinkStyles>
            </ContainerStyles>
            <ModalStyle
            isOpen={modalIsOpen}
            >
                <Carousel>
                    {images.map(item => (
                        <div key={item.id}>
                            <img src={item.urlImage} alt="" />
                        </div>
                    ))}
                </Carousel>

                <CloseModalStyle onClick={closeModal}>X</CloseModalStyle>

            </ModalStyle>
        </>

    )
}


