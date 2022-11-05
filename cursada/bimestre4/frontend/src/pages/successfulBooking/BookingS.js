import React from "react";
import Modal from "react-modal";
import { BodyStyle, DivStyle, ImageStyle, H2Style, H3Style } from "./BookingSStyled";
import logo from "../../ui/success-booking.png";
import ButtonC from "../../components/button/Button";
import { Link } from 'react-router-dom'


const buttonStyles = {
  content: {
    position: "absolute",
    background: "#1DBEB4",
    boxShadow: "0px 2px 4px rgba(0, 0, 0, 0.12)",
    borderRadius: "5px",
  },
};

Modal.setAppElement("#root");

function BookingS() {
  return (
    <BodyStyle >     
        <DivStyle>
          <ImageStyle src={logo} alt="Logo Success" />
          <H2Style>¡Muchas Gracias!</H2Style>
          <H3Style>Su reserva se ha realizado con éxito</H3Style>
          <Link to={'/'}>
            <ButtonC
              width="10rem"
              theme="secondary"
              style={buttonStyles}
            >
              ok
            </ButtonC>
          </Link>
        </DivStyle>  
    </BodyStyle>
  );
}

export default BookingS;
