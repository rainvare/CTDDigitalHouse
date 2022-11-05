import styled from "styled-components";
import { theme } from "../../../../ui/theme";

export const StyledGreeting = styled.div`
    display:flex;
    flex-direction: column;
    color: rgb(141, 141, 141);
    cursor: default;
    p:nth-child(2){
        color: ${theme.primary};
    }
`