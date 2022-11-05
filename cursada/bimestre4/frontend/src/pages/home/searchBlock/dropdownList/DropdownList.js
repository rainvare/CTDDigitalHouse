import React, { useEffect, useState, useRef } from 'react';
import { SelectStyled, OptionStyled, ContainerStyled } from './DropdownListStyled';
import { AxiosInstance } from '../../../../helpers/AxiosHelper';

export default function DropdownList({ picCity, icon, getAndSetSelectedCityID }) {
  const [displayList, setDisplayList] = useState("none");
  const selectRef = useRef();
  const [city, setCity] = useState("¿A dónde vamos?");
  const [cities, setCities] = useState([]);
  const [selectedCityID, setSelectedCityId] = useState(0);


  // Fill cities dropdown list with values coming from API endpoint 
  useEffect(() => {
    AxiosInstance.get('/cities').then(cities => setCities(cities.data))
  }, [])

  useEffect(() => {
    /* Hidde component*/
    const closeDropdown = (e) => {
      if (e.path[0] !== selectRef.current) {
        setDisplayList("none");
      }
    };
    /* listener  */
    document.body.addEventListener("click", closeDropdown);
    return () => document.body.removeEventListener("click", closeDropdown);
  }, []);


  /* Show and hidde List */
  const toggleList = () => {
    displayList === "none" ? setDisplayList("initial") : setDisplayList("none");
  };

  const handleSelect = (e) => {
    setCity(e.target.textContent);
    setSelectedCityId(e.target.children[1].children[2].value)
  };

  // Disparo un Timeout para que cuando haya un cambio en "selectedCityID" se dé lugar a finalizar el seteo de esa variable de estado y podamos capturar su valor
  setTimeout(() => {
    getAndSetSelectedCityID(selectedCityID)
  }, 25)

  return (
    <>
      <SelectStyled onClick={() => toggleList()}>
        <p ref={selectRef}>{city}</p>
      </SelectStyled>

      <ContainerStyled displayList={displayList}>
        {cities.map((city, i) => (
          <div key={i} className="important" onClick={handleSelect}>
            <OptionStyled>
              <div className="icon">{icon}</div>
              <div className="city-container">
                <h4>{city.name + ", "}</h4>
                <p>{city.country} </p>
                <input type="hidden" name="cityID" value={city.id} />
              </div>
            </OptionStyled>
          </div>
        ))}

      </ContainerStyled>
    </>
  );
}