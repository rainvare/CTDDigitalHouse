import React, { useState, useContext } from "react";
import { usePathname } from "../../hooks/hooks";
import { useNavigate } from "react-router-dom";
import { GlobalStyle, ScheduleMainStyled, ButtonScheduleStyled, ScheduleIngresarReservaDiv } from "./ScheduleStyle";
import { UserContext } from "../../hooks/UseContext";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import Button from "../button/Button";
import "./CalendarStyled.css";
import Swal from "sweetalert2";

const Container = ({ children }) => {

  const { loggedUser } = useContext(UserContext)

  const pathName = usePathname();
  const isInBookingPage = pathName.includes("reservas");
  const isInProductPage = pathName.includes("producto") && !isInBookingPage;
  const isInHomePage = !isInProductPage && !isInBookingPage;
  const navigate = useNavigate();



  const startBooking = () => {
    if (!loggedUser) {
      Swal.fire('Por favor inicia sesión primero', '', 'warning')
      navigate('/login');
      return
    }

    navigate(`${pathName}/reservas`)
  }

  return (
    <GlobalStyle isInProductPage={isInProductPage} isInBookingPage={isInBookingPage}
    >
      <ScheduleMainStyled isInProductPage={isInProductPage} isInBookingPage={isInBookingPage}>
        <div style={{ width: '100%', display: 'flex', justifyContent: 'space-around' }}>{children}</div>
      </ScheduleMainStyled>

      {isInProductPage &&
        <ScheduleIngresarReservaDiv>
          <p>Agregá tus fechas de viaje para obtener precios exactos</p>
          <ButtonScheduleStyled>
            <Button width="28rem" theme="secondary" onClick={startBooking}>
              Iniciar reserva
            </Button>
          </ButtonScheduleStyled>
        </ScheduleIngresarReservaDiv>
      }
      {
        isInHomePage &&
        <ButtonScheduleStyled>
          <Button width="12.5rem" theme="secondary">
            Aplicar
          </Button>
        </ButtonScheduleStyled>
      }
    </GlobalStyle>
  );
};


/* Calendar*/
const Calendar = ({ picDate, inline, readOnly, monthsShown, includeDateIntervals }) => {
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const onChange = (dates) => {
    const [start, end] = dates;
    setStartDate(start);
    setEndDate(end);
    picDate(start, end);
  };

  return (
    <DatePicker
      onChange={onChange}
      startDate={startDate}
      endDate={endDate}
      calendarContainer={Container}
      selectsRange
      isClearable
      includeDateIntervals={includeDateIntervals}
      showPreviousMonths={false}
      monthsShown={monthsShown}
      readOnly={readOnly}
      inline={inline}
      dateFormat="dd/MM/yyyy"
      minDate={new Date()}
      placeholderText="Chech in - Check out"
      formatWeekDay={(nameOfDay) => nameOfDay.slice(0, 1)}
      renderCustomHeader={({
        monthDate,
        customHeaderCount,
        decreaseMonth,
        increaseMonth,
      }) => (
        <div>
          <button
            aria-label="Previous Month"
            className={
              "react-datepicker_navigation react-datepicker_navigation--previous"
            }
            style={customHeaderCount === 1 ? { visibility: "hidden" } : null}
            onClick={decreaseMonth}
          >
            <span
              className={
                "react-datepicker_navigation-icon react-datepicker_navigation-icon--previous"
              }
            >
              {"<"}
            </span>
          </button>
          <span className="react-datepicker__current-month">
            {monthDate.toLocaleString("es-US", {
              month: "long",
            })}
          </span>
          <button
            aria-label="Next Month"
            className={
              "react-datepicker_navigation react-datepicker_navigation--next"
            }
            style={customHeaderCount === 0 ? { visibility: "hidden" } : null}
            onClick={increaseMonth}
          >
            <span
              className={
                "react-datepicker_navigation-icon react-datepicker_navigation-icon--next"
              }
            >
              {">"}
            </span>
          </button>
          <div className="react-datepicker__month"></div>
        </div>
      )}
    />
  );
};


export default function Schedule({ placeHolderText, picDate, inline, readOnly, monthsShown, includeDateIntervals }) {
  return <Calendar picDate={picDate} placeholderText={placeHolderText} inline={inline} readOnly={readOnly} monthsShown={monthsShown} includeDateIntervals={includeDateIntervals} />;
}