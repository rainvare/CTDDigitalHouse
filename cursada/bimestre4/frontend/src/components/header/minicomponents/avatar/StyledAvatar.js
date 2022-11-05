import styled from "styled-components";
import { theme } from "../../../../ui/theme";

export const StyledAvatar = styled.div`
display:flex;
justify-content: center;
align-items: center;
cursor: pointer;
border-radius: 10rem;
height: 2.5rem;
    width: 2.5rem;
    background-color: ${theme.secondary};
    color: #fff;
`