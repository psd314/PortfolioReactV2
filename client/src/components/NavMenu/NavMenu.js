import React from "react";
import "./NavMenu.css";
import NavigationLink from "../NavigationLink/NavigationLink";


const NavMenu = () => {
    return (
        <nav className="navMenu">
            <NavigationLink pageRoute="/" linkText="Home" />
            <NavigationLink pageRoute="/About" linkText="About" />
            <NavigationLink pageRoute="/Contact" linkText="Contact" />
            <NavigationLink pageRoute="/Projects" linkText="Projects" />
        </nav>
    );
} 

export default NavMenu;