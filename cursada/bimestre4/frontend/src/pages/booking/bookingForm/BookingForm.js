import React,  { useContext }  from 'react'
import { FormStyle, FormTitle, ColumnForm, InputContainer, TextInput, LabelStyle, SubTitle, Column, CalendarContainerStyle, TextError } from './BookingFormStyle'
import Select from 'react-select'
import Schedule from '../../../components/schedule/Schedule'
import { UserContext } from '../../../hooks/UseContext'



export default function BookingForm({ values,handleChange, handleSelectChange, picDate }) {
    const { loggedUser } = useContext(UserContext)

    const optionsHours = [
        "00:00",
        "01:00",
        "02:00",
        "03:00",
        "04:00",
        "05:00",
        "06:00",
        "07:00",
        "08:00",
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
        "21:00",
        "22:00",
        "23:00",
        "seleccionar hora de llegada",
    ];

    return (
        <>
            <ColumnForm>
                <FormTitle>Completa tus datos</FormTitle>
                <FormStyle name="form">
                    <InputContainer>
                        <LabelStyle>Nombre</LabelStyle>
                        <TextInput
                            type="text"
                            name="nombre"
                            placeholder="Nombre"
                            onChange={handleChange}
                            disabled={true}
                            value={loggedUser ? loggedUser?.name : ""}
                            style={{background: '#DFE4EA'}}
                        />
                    </InputContainer>
                    <InputContainer>
                        <LabelStyle>Apellido</LabelStyle>
                        <TextInput
                            type="text"
                            name="apellido"
                            placeholder="Apellido"
                            onChange={handleChange}
                            disabled={true}
                            value={loggedUser ? loggedUser?.surname : ""}
                            style={{background: '#DFE4EA'}}
                        />
                    </InputContainer>
                    <InputContainer>
                        <LabelStyle>Correo electronico</LabelStyle>
                        <TextInput
                            type="email"
                            name="email"
                            placeholder="correo@electronico.com"
                            onChange={handleChange}
                            disabled={true}
                            value={loggedUser ? loggedUser?.email : ""}
                            style={{background: '#DFE4EA'}}
                        />
                    </InputContainer>
                    <InputContainer>
                        <LabelStyle>Ciudad</LabelStyle>
                        <TextInput
                            type="text"
                            name="ciudad"
                            placeholder="Ciudad"
                            onChange={handleChange}
                            required 
                        />
                    </InputContainer>
                </FormStyle>
            </ColumnForm>
            <FormTitle>Seleccioná tu fecha de reserva</FormTitle>
            <CalendarContainerStyle>
                <Schedule inline picDate={picDate} monthsShown={2} />
            </CalendarContainerStyle>
            {values.errorDate && <TextError>Debe seleccionar un rango de fechas</TextError>}
            <FormTitle>Indica tu horario estimado de llegada</FormTitle>
        <FormStyle>
            <SubTitle>Tu habitacion va a estar lista para el check-in entre las 10:00AM y las 11:00PM
            </SubTitle>
            <Column>
                <p>Indica tu horario estimado de llegada</p>
                <Select
                defaultValue={{label: optionsHours[24], value: optionsHours[24]}}
                options={optionsHours.map(item => ({label: item, value: item}))}
                onChange = {handleSelectChange}
                />
                {values.errorHour && <TextError>Debe seleccionar una opción</TextError>}
            </Column>
        </FormStyle>
        </>

    )
}