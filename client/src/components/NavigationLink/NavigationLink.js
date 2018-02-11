import React from "react";
import { NavLink } from 'react-router-dom';
import "./NavigationLink.css";

const NavigationLink = (props) => {
    return (
        <div className="links">
            <NavLink to={props.pageRoute}>{props.linkText}</NavLink>
        </div>
    );
}

export default NavigationLink;