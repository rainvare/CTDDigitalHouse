import styled from "styled-components";

export const GalleryMobileStyle = styled.div`
display: none;
margin-bottom:20px;
.carousel .thumbs-wrapper {
  display:none;

}

@media (max-width: 768px) {
    display: block;
  
    .carousel-slider{
      height: 100%;
    }

    .carousel .slider-wrapper{
      height: 400px;
    }

    .carousel .control-dots {
      display:none;
    }
   
  }

  @media (max-width: 600px) {
    display: block;
   
    // .carousel-slider{
    //   max-height: 350px;
    // }

    .carousel .slide img{
      height:100%;
    }
}

@media (max-width: 530px) {
  .carousel-slider{
    max-height: 275px;
  }
}
`

export const MobileImage = styled.img`
@media (max-width: 768px) {
  height: 100%;
  }
  
`