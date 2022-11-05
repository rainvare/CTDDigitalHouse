import React, { useState, useEffect } from "react";
import Home from './pages/home/Home'
import Header from "./components/header/Header";
import Footer from "./components/footer/Footer";
import Login from "./pages/login/Login";
import Register from "./pages/register/Register";
import ProductDetails from "./pages/product/productDetails/ProductDetails";
import Booking from "./pages/booking/Booking";
import BookingS from "./pages/successfulBooking/BookingS"
import { Routes, Route } from 'react-router-dom'
import { theme } from './ui/theme'
import { ThemeProvider } from 'styled-components';
import jwt_decode from 'jwt-decode'
import LocalStorageHelper from "./helpers/LocalStorageHelper";
import { UserContext } from "./hooks/UseContext";


const user = LocalStorageHelper.getItem('Token') ? jwt_decode(LocalStorageHelper.getItem('Token'))["user_info"] : null;

function App() {
  const [loggedUser, setLoggedUser] = useState(null);

  useEffect(() => {
    if (user) setLoggedUser({ id: user.id, name: user.name, surname: user.surname, email: user.email, city: user.city })
  }, [])

  return (
    <UserContext.Provider value={{ loggedUser, setLoggedUser }}>
      <ThemeProvider theme={theme}>
        <Header />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/registro" element={<Register />} />
          <Route path='/producto/:productId' element={<ProductDetails />} />
          <Route path='/producto/:productId/reservas' element={<Booking />} />
          <Route path='/producto/:productId/reservas/reserva-exitosa' element={<BookingS />} />
        </Routes>
        <Footer />
      </ThemeProvider>
    </UserContext.Provider>
  );

}

export default App;