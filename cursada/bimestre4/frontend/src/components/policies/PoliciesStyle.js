import styled from "styled-components";

export const PoliciesStyle = styled.div`
  padding: 40px 30px 80px 30px;
  display:grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap:30px;
  align-items: center;
  justify-items: start;
  p{
    color: ${props => props.theme.text_secondary}
  }

  @media (max-width: 768px){
    grid-template-columns: 1fr 1fr ;
    gap:40px;
  }

  @media (max-width: 414px){
    grid-template-columns: 1fr;
    gap:40px;
  }
`
