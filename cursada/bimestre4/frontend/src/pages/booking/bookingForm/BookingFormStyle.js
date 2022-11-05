import styled from "styled-components";


export const ColumnForm = styled.div`
display: flex;
flex-direction: column;

`
export const FormTitle = styled.h2`
  color: ${(props) => props.theme.text_secondary};
  font-weight: 700;
  margin:25px 0 0 0px;
`

export const FormStyle = styled.form`
background-color: ${(props) => props.theme.background};
margin: 15px 20px 10px 0px;
padding: 20px;
border-radius: 10px;
box-shadow: 0px 5px 6px 0px rgba(0,0,0,0.1);
display:flex;
flex-wrap: wrap;
flex-direction: row;
width: 100%;
color:${(props) => props.theme.text_secondary};

@media (max-width: 414px){
  flex-direction:column;
}
`
export const CalendarContainerStyle = styled.div`
background-color: ${(props) => props.theme.background};
margin: 15px 20px 10px 0px;
padding: 5px;
border-radius: 10px;
box-shadow: 0px 5px 6px 0px rgba(0,0,0,0.1);
width: 100%;
`
export const InputContainer = styled.div`
  display: flex;
  align-items: flex-start;
  flex-direction: column;
  flex: 1;
  padding: 10px;
   min-width: 50%;
`;

export const LabelStyle = styled.label`
padding-bottom:8px;
`

export const TextInput = styled.input`
  border-radius: 5px;
  width: 100%;
  height: 40px;
  border: solid 1.5px #d3d3d3;
  box-shadow: 0px 10px 15px -3px rgba(0,0,0,0.1);
  text-indent: 5px;
  color: '#383B58';
  opacity: 0.8;


`
export const ErrorText = styled.p`
  color: red;
  width: 100%;
  padding: 5px;
`;



export const SubTitle = styled.h4`
display: flex;
flex-direction: row;
align-items: center;
font-weight: 700;
padding:5px 5px;

`
export const Column = styled.div`
display: flex;
flex-direction: column;
padding: 5px;
color: '#383B58';
opacity: 0.8;
p{
    padding-bottom:10px;
    font-size:15px;
}
`
export const TextError = styled.p `
color: red;
padding:5px;
`


