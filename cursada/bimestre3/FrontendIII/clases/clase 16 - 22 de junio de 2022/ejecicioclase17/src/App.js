import { BrowserRouter, Routes , Route } from "react-router-dom";  
import Home from "./pages/Home";
import Information from "./pages/about/Information";
import Biography from "./pages/about/Biography";
import Education from "./pages/about/Education";
import Experience from "./pages/about/Experience";
import Error from "./components/Error"

function App() {
  return (

<BrowserRouter>
      <Routes>
        <Route path="/" exact element={<Home/>} />
        <Route path="/information" element={<Information />} />
        <Route path="/biography" element={<Biography/>} />
        <Route path="/education" element={<Education/>} />
        <Route path="/experience" element={<Experience/>} />
        <Route path="*" element={<Error/>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
