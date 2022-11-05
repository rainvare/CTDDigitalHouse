import styled from "styled-components";

export const ImageCategoryStyles = styled.div`
    height: 273px;
    width: 100%;

    img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
`;

export const InfoCategoryStyle = styled.div`
    display: flex;
    flex-direction: column;
    width:100%;
    padding:10px;

    @media(max-width: 114px){
        padding: 14px;
    }
    
`;

 export const TitleCategoryStyle = styled.h3`
    font-weight: 700;
    font-size: 20px;
    line-height: 23px;
    color: #383B58;
 `;

export const DescriptionCategoryStyle = styled.p`
    font-weight: 700;
    font-size: 14px;
    line-height: 16px;
    color: #383B58;
    opacity: 0.6;
    
`;
