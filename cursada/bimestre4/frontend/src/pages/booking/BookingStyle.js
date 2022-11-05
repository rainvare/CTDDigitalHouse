import styled from "styled-components";

export const BodyStyle = styled.section`
padding-top:81px;
`

export const ContainerStyle = styled.div`
// display:flex;
// justify-content:center;

display: grid;
grid-template-columns: 2fr 1fr;
margin-bottom:30px;

@media (max-width: 768px){
  // flex-direction:column;
  grid-template-columns: 1fr;
}
@media (max-width: 1050px){
  // flex-direction:column;
  grid-template-columns: 1fr;
}

`
export const ContainerForm = styled.div`
// width:900px;
margin: 20px 30px 10px 30px;
@media(max-width:1100px){
  // width:650px;
}

@media (max-width: 768px){
  // width:700px;
  margin:20px 30px 30px 30px;
}

@media (max-width: 414px){
  // width:350px;
  margin:20px 30px 30px 30px;
}
`
export const ContainerBooking = styled.div`
// width:400px;
margin-top:80px;
margin-bottom:30px;
margin-right:30px;
@media (max-width: 768px){
  margin:0 30px 30px 30px;
  // width:700px;
}
@media (max-width: 1050px){
  // flex-direction:column;
  margin:0 30px 30px 30px;
}
@media (max-width: 414px){
  // width:350px;
}
`

export const LineStyles = styled.hr`
  border-color:${props => props.theme.primary};
`

