import styled from "styled-components";

export const StyledHeader = styled.header`
  background-color: #fff;
  width: 100%;
  height: 80px;
  position: fixed;
  display: flex;
  justify-content: space-between;
  background-color: #fff;
  z-index: 1;

  @media only screen and (max-width: 414px) {
    box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.2);
  }
`;

export const Slogan = styled.span`
  color: #545776;
  font-size: 20px;
  font-style: italic;
  animation: fadeIn 2s;

  @keyframes fadeIn {
    0% { opacity: 0; }
    100% { opacity: 1; }
  }

  @media (max-width: 800px) {
    display:none;
  }
`;

export const LogoSlogan = styled.div`
  display: flex;
  align-items: center;
  a {
    text-decoration: none;
  }

  @media only screen and (max-width: 414px) {
    span {
      display: none;
    }
  }
`;
