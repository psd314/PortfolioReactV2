import React from "react";
import "./NavLink.css";

const NavLink = (props) => {
    return (
        <div className="links">
            <a href={props.pageRoute}>{props.linkText}</a>
        </div>
    );
}

export default NavLink;