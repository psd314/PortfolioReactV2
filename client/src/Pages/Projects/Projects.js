import React, { Component } from "react";
import "./Projects.css";
import NavMenu from "../../components/NavMenu/NavMenu";
import nyt from "../../assets/images/NYT-React.png";
import carbon from "../../assets/images/CarbonSense.png";
import rps from "../../assets/images/MultiplayerRPS.png";

class Projects extends Component {
    render() {
        return (
            <div className="Projects">
            <NavMenu/>
                <h1>Projects</h1>
                <div className="projectLinks">
                    <h3><img src={nyt} alt="new york times scraper app thumbnail"/><a target="_blank" rel="noopener noreferrer" href="https://vast-anchorage-50243.herokuapp.com/">New Yorks Times React Scraper</a></h3>
                    <br/>
                    <h3><img src={carbon} alt="carbon sense app thumbnail"/><a target="_blank" rel="noopener noreferrer" href="https://secure-island-35963.herokuapp.com/">Carbon Sense</a></h3>
                    <br/>
                    <h3><img src={rps} alt="multiplayer rock paper scissors app thumbnail"/><a target="_blank" rel="noopener noreferrer" href="https://psd314.github.io/RPS-Multiplayer/">Multiplayer Rock, Paper, Scissors</a></h3>
                </div>
            </div> 
        );
    }
}

export default Projects;