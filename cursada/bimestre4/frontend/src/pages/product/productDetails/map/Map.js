import React from 'react'
// import GoogleMaps from 'simple-react-google-maps'
import { GoogleMap, LoadScript } from '@react-google-maps/api';
import { MapStyle } from './MapStyle'



export default function Map({product}) {

const containerStyle = {
  width: '100%',
  height: '400px'
};

const center = {
  lat: product.longitude,
  lng: product.latitude
};

  return (
    <MapStyle>
       <LoadScript
      googleMapsApiKey="AIzaSyAzigRs7GV_3NryOpKj7XR7gvbW9vs9HHc"
    >
      <GoogleMap
        mapContainerStyle={containerStyle}
        center={center}
        zoom={10}
      >
        
      </GoogleMap>
    </LoadScript>
    {/* <GoogleMaps
  apiKey={"AIzaSyAzigRs7GV_3NryOpKj7XR7gvbW9vs9HHc"}
  style={{height: "400px", width: "100%"}}
  zoom={15}
  center={{lat: product.longitude, lng: product.latitude}}
  markers={{lat: product.longitude, lng: product.latitude}} 
/> */}
    </MapStyle>
    
  )
}
