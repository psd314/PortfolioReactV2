import React, { Component } from "react";
import "./Projects.css";

class Projects extends Component {
    render() {
        return (
            <div className="projectsPlacard">
                <div>
                    <div className="smallLinks">
                        <a href="/">Home | </a>
                        <a href="/About"> About | </a>
                        <a href="Projects"> Projects</a>
                    </div>
                    <h1>Projects</h1>
                </div>
                <div className="aboutText">
                    <p>Lorum ipsum dolor and stuff</p>
                </div>
            </div>
        );
    }
}

export default Projects;