import React, { useState } from "react";
import {
  ContainerSearchBlock,
  SearchBlockTitle,
  SearchBar,
  ButtonStyle
} from "./SearchBlockStyled";
import DropdownList from "./dropdownList/DropdownList";
import Schedule from "../../../components/schedule/Schedule";
import { FaMapMarkerAlt, FaRegCalendarAlt } from "react-icons/fa";
import Button from "../../../components/button/Button";
import SearchInput from "../searchBlock/SearchInput"
import { AxiosInstance } from "../../../helpers/AxiosHelper";

const SearchBlock = (props) => {
  const [selectedCityID, setSelectedCityId] = useState(0);


  const filterProductsByCity = () => {
    if (!selectedCityID) return;

    AxiosInstance.get(`/products/city/${selectedCityID}`, {
    })
      .then(products => {
        props.setProductsToDisplayByCity(products.data)
        props.setRecommendationsTitle(products.data[0].city.name)
      })
      .catch(err => console.warn(err))
  }

  // Metodo para setear "selectedCityID" state capturado en el componente DropdownList
  const getAndSetSelectedCityID = (selectedCityID) => setSelectedCityId(selectedCityID)

  // Al realizar submit del form de buscador, se llama al endpoint de buscar productos por Id de Ciudad
  // y mediante props seteo la lista de productos a mostrar (productsToDisplay)
  const handleSubmit = (e) => {
    e.preventDefault();
    filterProductsByCity();
  }

  return (
    <ContainerSearchBlock>
      <SearchBlockTitle>
        Busca ofertas en hoteles, casas y mucho más
      </SearchBlockTitle>
      <form onSubmit={handleSubmit}>
        <SearchBar>
          <SearchInput
            input={<DropdownList city={props.city} icon={<FaMapMarkerAlt />} getAndSetSelectedCityID={getAndSetSelectedCityID} />}
            icon={<FaMapMarkerAlt />}
          />
          <SearchInput
            input={<Schedule icon={<FaRegCalendarAlt />} picDate={props.picDate} monthsShown={2} />}
            icon={<FaRegCalendarAlt />}
          />
          <ButtonStyle>
            <Button type="submit" width="100%" theme="secondary">Buscar</Button>
          </ButtonStyle>
        </SearchBar>
      </form>
    </ContainerSearchBlock>
  );
}

export default SearchBlock;
