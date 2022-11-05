
import { FaFacebook, FaLinkedinIn, FaTwitter,FaInstagram } from "react-icons/fa";
import { ContainerFooter, FooterBlock,FooterText, FooterIcon } from './FooterStyled'



import React from 'react'

export default function Footer() {
    return (
        <ContainerFooter>
            <FooterBlock>
                <FooterText> ©2022 Wesped</FooterText>
            </FooterBlock>
            <FooterBlock>
                <FooterIcon><FaFacebook /></FooterIcon>
                <FooterIcon><FaLinkedinIn /></FooterIcon>
                <FooterIcon><FaTwitter /></FooterIcon>
                <FooterIcon><FaInstagram /></FooterIcon>
            </FooterBlock>
        </ContainerFooter >
    )
}
