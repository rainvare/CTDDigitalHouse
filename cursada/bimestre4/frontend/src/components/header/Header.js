import React from "react";
import Logo from "./minicomponents/Logo";
import Nav from "./minicomponents/Nav";
import { Link } from "react-router-dom";
import { StyledHeader, LogoSlogan, Slogan } from './StyledHeader'

const Header = () => {
  const slogan = [
    "Sentite como en tu hogar",
    "Tu mejor descanso en un solo lugar",
    "Encuentra la estadía de tus sueños",
    "Las mejores estadías en un solo lugar",
  ];

  const randomSloganIndex = Math.round(Math.random() * 3);

  return (
    <div>
      <StyledHeader>
        <LogoSlogan>
          <Link to="/">
            <Logo />
          </Link>
          <Link to="/">
            <Slogan>{slogan[randomSloganIndex]}</Slogan>
          </Link>
        </LogoSlogan>
        <Nav />
      </StyledHeader>
    </div>
  );
};

export default Header;