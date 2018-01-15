import React, { Component } from "react";
import Gears from "../../components/Gears/Gears";
import NavLink from "../../components/NavLink/NavLink";
import "./Home.css";

class Home extends Component {
    render() {
        return (
            <div style={{paddingTop: 75}}>
                <div id="home">
                    <NavLink
                        pageRoute="/"
                        linkText="Home" />
                </div>
                <div id="about">
                    <NavLink
                        pageRoute="/About"
                        linkText="About" />
                </div>
                <div id="projects">
                    <NavLink
                        pageRoute="/Projects"
                        linkText="Projects" />
                </div>
                <Gears />
            </div>
        );
    }
}

export default Home;