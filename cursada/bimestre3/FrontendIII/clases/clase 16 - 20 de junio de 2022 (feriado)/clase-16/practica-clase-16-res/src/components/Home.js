import React from "react";
import { Link } from "react-router-3";

const Home = (props) => {
  return (
    <div>
      <ul role="nav">
        <li>
          <Link to="/">๐ ๐  Home ๐ ๐ </Link>
        </li>
        <li>
          <Link to="/guauguaus">๐ถ Guauguaus ๐ถ</Link>
        </li>
        <li>
          <Link to="/miaumiaus">๐ธ Miaumiaus ๐ธ</Link>
        </li>
      </ul>
      <hr />
      <h2>โจโจTenemosโจโจ</h2>
      {props.children}
    </div>
  );
};
export default Home;
