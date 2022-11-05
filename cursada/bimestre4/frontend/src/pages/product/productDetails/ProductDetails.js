import {
  BodyStyle,
  ShareStyle,
  DescriptionStyle,
  LineStyles,
  FeaturesStyle,
  TitleStyles
} from './ProductDetailsStyles'
import { FaRegHeart } from "react-icons/fa";
import { BiShareAlt } from "react-icons/bi";
import { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import { AxiosInstance } from '../../../helpers/AxiosHelper';
import { Icons } from '../../../ui/icons';
import GalleryBlock from './galleryBlock/GalleryBlock';
import GalleryMobile from './galleryMobile/GalleryMobile';
import Section from '../../../components/section/Section';
import HeaderProduct from '../../../components/headerProduct/HeaderProduct';
import UbicationProduct from './ubicationProduct/UbicationProduct';
import Policies from '../../../components/policies/Policies';
import Schedule from '../../../components/schedule/Schedule';
import Map from './map/Map'

export default function ProductDetails(to) {

  const [modalIsOpen, setIsOpen] = useState(false);

  function openModal() {
    setIsOpen(true)
  }
  function closeModal() {
    setIsOpen(false);
  }

  const { productId } = useParams();

  const [product, setProduct] = useState(null);


  useEffect(() => {
    AxiosInstance.get(`/products/${productId}`)
      .then((res) => {
        res.data.images = res.data.images.sort((lhs, rhs) => lhs.id - rhs.id)
        setProduct(res.data);
      })

  }, [productId]);

  return (
    <>
      {product ?
        <BodyStyle isOpen={modalIsOpen}>
          <HeaderProduct product={product} to={"/"} />
          <UbicationProduct product={product} />
          <Section>
            <ShareStyle>
              <div><BiShareAlt /></div>
              <div style={{ cursor: "pointer" }}><FaRegHeart /></div>
            </ShareStyle>
            <GalleryBlock images={product.images} modalIsOpen={modalIsOpen} openModal={openModal} closeModal={closeModal} />
            <GalleryMobile images={product.images} />
            <DescriptionStyle>
              <h4>Descripción del lugar</h4>
              <p>{product.description}</p>
            </DescriptionStyle>
            <TitleStyles>¿Que ofrece este lugar?</TitleStyles>
            <LineStyles />
            <FeaturesStyle>
              {product.features.map(item => (
                <div key={item.id}><span>{Icons[item.icon]}</span><p>{item.title}</p></div>
              ))}
            </FeaturesStyle>
            <TitleStyles>Fechas disponibles</TitleStyles>
            <Schedule inline buttonText="Iniciar reserva" readOnly={true} monthsShown={2} includeDateIntervals={[]} />
            <TitleStyles>¿Dónde vas a estar?</TitleStyles>
            <LineStyles />
            <Map product={product} />
            <TitleStyles>Qué tenés que saber</TitleStyles>
            <LineStyles />
            <Policies product={product} />
          </Section>
        </BodyStyle> :
        <p>Cargando...</p>
      }
    </>

  )
}
