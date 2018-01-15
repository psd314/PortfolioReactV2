import React from "react";
import "./NavMenu.css";
import NavLink from "../NavLink/NavLink";


const NavMenu = () => {
    return (
        <nav className="navMenu">
            <NavLink pageRoute="/" linkText="Home" />
            <NavLink pageRoute="/About" linkText="About" />
            <NavLink pageRoute="/Projects" linkText="Projects" />
        </nav>
    );
}

export default NavMenu;