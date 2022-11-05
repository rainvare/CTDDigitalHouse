import React from "react";
import Categories from "./categories/Categories";
import SearchBlock from "./searchBlock/SearchBlock";
import Recommendations from "./recommendations/Recommendations";
import { useState, useEffect } from "react";
import { AxiosInstance } from "../../helpers/AxiosHelper";
import Section from "../../components/section/Section";

const Home = () => {
  const [products, setProducts] = useState([]);
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [title, setTitle] = useState("");

  const setProductsToDisplayByCity = (city) => setProducts(city);

  useEffect(() => {
    AxiosInstance.get("/products").then((res) => {
      setProducts(res.data);
    });
  }, []);

  useEffect(() => {
    const url = selectedCategory
      ? `/products/category/${selectedCategory}`
      : "/products";
    AxiosInstance.get(url).then((res) => setProducts(res.data));
  }, [selectedCategory]);

  return (
    <>
      <SearchBlock setProductsToDisplayByCity={setProductsToDisplayByCity} setRecommendationsTitle={setTitle} />
      <Section>
        <Categories setSelectedCategory={setSelectedCategory} setRecommendationsTitle={setTitle} />
        <Recommendations products={products} selectedCategory={selectedCategory} title={title} />
      </Section>

    </>
  );
};

export default Home;
