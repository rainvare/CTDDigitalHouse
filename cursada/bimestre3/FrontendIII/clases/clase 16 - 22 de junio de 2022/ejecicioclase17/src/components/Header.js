import GoTo from "./GoTo";


const Header = () => {
  return (
    <header>
      <nav>
        <ul>
        <li>
            <GoTo
              argumentOne={"Home"}
              argumentTwo={"/home"}
            />
          </li>
          <li>
            <GoTo
              argumentOne={"Personal Information"}
              argumentTwo={"/information"}
            />
          </li>
          <li>
            <GoTo argumentOne={"Biography"} argumentTwo={"/biography"} />
          </li>
          <li>
            <GoTo argumentOne={"Education"} argumentTwo={"/education"} />
          </li>
          <li>
            <GoTo argumentOne={"Experience"} argumentTwo={"/experience"} />
          </li>
        </ul>
      </nav>
    </header>
  );
};

export default Header;
