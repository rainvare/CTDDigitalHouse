import { useLocation } from "react-router-dom";

export const usePathname = () => useLocation().pathname;

const test = 2;