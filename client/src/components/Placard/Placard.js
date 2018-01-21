import React from "react";
import "./Placard.css";

const Placard = (props) => {
    return (
        <div className="PlacardStyles">
            <h1>{props.title}</h1>
        </div>
    );
}

export default Placard;