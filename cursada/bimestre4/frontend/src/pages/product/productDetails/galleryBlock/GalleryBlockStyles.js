import styled from "styled-components";


export const ContainerStyles = styled.section`
// max-width: 1366px;
// margin: 0 auto;
padding: 0 30px;
position: relative;

//grid
display: grid;
grid-template-columns: 1fr 1fr;
gap: 10px;

@media (max-width: 768px) {
    display: none;
  }
`
export const ContainerImageRight = styled.div`
//grid
display:grid;
grid-template-columns: repeat(2, 1fr);
gap: 10px;

`
export const CardLeft = styled.div`
height:100%;
border-radius: 8px;
overflow: hidden;
`
export const CardRight = styled.div`
height:100%;
position:relative;
border-radius: 8px;
overflow: hidden;
`

export const ImageLeft = styled.img`
max-width: 100%;
height:100%;
`
export const ImageRight = styled.img`
min-width: 100%;
max-width: 100%;
height:100%;
`

export const LinkStyles = styled.p`
position:absolute;
color: #fff;
bottom:20px;
right:50px;
font-size: 18px;
font-weight: 700;
cursor:pointer;
text-decoration: underline;
`
export const ModalStyle = styled.div`
background-color: rgba(0,0,0,0.9);
height:100%;
width:100vw;
position: absolute;
top:0px;
left: 0px;
padding-top:141px;
display: ${props => props.isOpen ? " " : "none"};

.carousel .slider-wrapper{
  height:480px;
}


div{
max-width:721px;;
max-height:628px;
margin: auto;
border-radius: 10px;
   
}

@media (max-width: 768px){
  display:none;
}

`

export const CloseModalStyle = styled.div`
top: 100px;
right: 40px;
font-size: 30px;
font-weight:600;
color: white;
position: absolute;
cursor:pointer;


`

