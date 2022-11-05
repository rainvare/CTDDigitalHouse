import styled from "styled-components"
import { theme } from "../../../../ui/theme"

export const BurgerButton = styled.div`
.nav-icon-5{
    width: 35px;
    height: 30px;
    margin: 10px 10px;
    position: relative;
    cursor: pointer;
    display: inline-block;
    z-index: 2;
}
  .nav-icon-5 span{
    background-color: ${theme.text_secondary};
    position: absolute;
    border-radius: 2px;
    transition: .3s cubic-bezier(.8, .5, .2, 1.4);
    width:100%;
    height: 4px;
    transition-duration: 500ms
}

.nav-icon-5 span:nth-child(1){
    top:0px;
    left: 0px;
}
.nav-icon-5 span:nth-child(2){
    top:13px;
    left: 0px;
    opacity:1;
}
.nav-icon-5 span:nth-child(3){
    bottom:0px;
    left: 0px;
}
.nav-icon-5.open span:nth-child(1){
    transform: rotate(45deg);
    top: 13px;
}
.nav-icon-5.open span:nth-child(2){
    opacity:0;
}
.nav-icon-5.open span:nth-child(3){
    transform: rotate(-45deg);
    top: 13px;
}
`

export const StyledBackgroundMenu = styled.div`
    position: absolute;
    background-color: rgba(255, 255, 255, .5);
    backdrop-filter: blur(4px);
    height: 100vh;
    width: 100%;
    left:800px;
    top: 0px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    transition: all .9s ease;
    &.active{
        top:0px;
        left:0px;
    }
    a{
        border-radius: 10px;
        position: relative;
        padding: 1rem;
        top: 100px;
        display: block;
        margin: .5rem;
        font-size: 1.8rem;
        text-decoration: none;
        text-align: end;
        color: #333;
    }
    hr{
        color:#333;
        opacity: 0.4;
        margin-top: 5px;
}
`