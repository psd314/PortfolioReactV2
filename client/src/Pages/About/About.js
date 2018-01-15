import React, { Component } from "react";
import "./About.css";
import logo from "../../assets/images/philippe_dixon_profile_pic.png";

class About extends Component {
    render() {
        return (
            <div className="aboutPlacard">
                <div>
                    <div className="smallLinks">
                        <a href="/">Home | </a>
                        <a href="/About"> About | </a>
                        <a href="Projects"> Projects</a>
                    </div>
                    <h1>About Me</h1>
                </div>

                <div className="photoBox">
                    <img className="photo" src={logo} alt="me" />
                </div>
                <div className="aboutText">
                    <p>Lorum ipsum dolor and stuff</p>
                </div>
            </div>
        );
    }
}

export default About;