import React from 'react'
import HeaderProduct from '../../components/headerProduct/HeaderProduct'
import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { AxiosInstance } from '../../helpers/AxiosHelper';
import { BodyStyle, LineStyles, ContainerStyle, ContainerBooking, ContainerForm } from './BookingStyle'
import Policies from '../../components/policies/Policies';
import Section from '../../components/section/Section';
import BookingDetail from './bookingDetail/BookingDetail';
import BookingForm from './bookingForm/BookingForm'
import Swal from 'sweetalert2';
import jwt_decode from 'jwt-decode';
import LocalStorageHelper from '../../helpers/LocalStorageHelper'

function formatDate(date) {
  console.log(date);
  const year = date.getFullYear();
  const month = date.getMonth() + 1;
  const day = date.getDate();

  return `${year}-${month.toLocaleString('es-AR', { minimumIntegerDigits: 2 })}-${day.toLocaleString('es-AR', { minimumIntegerDigits: 2 })}`
}

export default function Booking(to) {

  let navigate = useNavigate();
  const { productId } = useParams();
  const [product, setProduct] = useState(null);
  // peticion GET
  useEffect(() => {
    AxiosInstance.get(`/products/${productId}`)
      .then((res) => {
        setProduct(res.data);
        res.data.images = res.data.images.sort((lhs, rhs) => lhs.id - rhs.id)
      })
  }, [productId]);


  const [values, setValues] = useState({
    nombre: '',
    apellido: '',
    email: '',
    ciudad: '',
    startDate: '',
    endDate: '',
    checkInHour: '',
    errorDate: false,
    errorHour: false,
  })

  const handleChange = (e) => {
    setValues({
      ...values,
      [e.target.name]: e.target.value,
    })
  }
  const picDate = (startDate, endDate) => {
    setValues({ ...values, startDate, endDate, errorDate: false, });
  }

  const handleSelectChange = ({ value }) => {
    setValues({ ...values, checkInHour: value, errorHour: false, })

  }

  const handleSubmit = (e) => {
    e.preventDefault();
    let errorDate = false;
    let errorHour = false;
    const token = LocalStorageHelper.getItem('Token');

    const user = jwt_decode(token);



    if (values.startDate === '' || values.endDate === '') {
      errorDate = true;
    }
    if (values.checkInHour === '') {
      errorHour = true;
    }

    if (errorHour || errorDate) {
      setValues({ ...values, errorDate: errorDate, errorHour: errorHour })
    } else {

      
      console.log({
        headers: {
          'Authorization': `Bearer ${token}`
        },
        data: {
          hour: `${values.checkInHour}:00`,
          checkin: formatDate(values.startDate),
          checkout: formatDate(values.endDate),
          product: {
            id: productId
          },
          user: {
            id: user.user_info.id
          }
        },
      });

      AxiosInstance.post(`/bookings`, {
        hour: `${values.checkInHour}:00`,
        checkin: formatDate(values.startDate),
        checkout: formatDate(values.endDate),
        product: {
          id: productId
        },
        user: {
          id: user.user_info.id
        }
      },
      {
        headers: {
          'Authorization': `Bearer ${token}`
        },
      })
        .then((res) => {
          console.log(res.data);
          navigate('reserva-exitosa');
        }).catch((error) => {
          Swal.fire({
            icon: 'error',
            text: 'Lamentablemente la reserva no ha podido realizarse. Por favor, intente mas tarde'
          })
          console.log(error);
        })
    }






  };








  return (
    <>
      {product ?
        <BodyStyle>
          <HeaderProduct product={product} to={"/producto/" + productId} />
          <Section>
            <ContainerStyle>
              <ContainerForm>
                <BookingForm values={values} handleChange={handleChange} handleSelectChange={handleSelectChange} picDate={picDate} />
              </ContainerForm>
              <ContainerBooking>
                <BookingDetail product={product} images={product.images} handleSubmit={handleSubmit} startDate={values.startDate} endDate={values.endDate} />
              </ContainerBooking>
            </ContainerStyle>
          </Section>
          <LineStyles />
          <Policies product={product} />
        </BodyStyle> :
        <p>Cargando...</p>
      }
    </>
  )

}

