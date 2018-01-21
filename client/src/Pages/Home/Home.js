import React, {Component} from "react";
import Gears from "../../components/Gears/Gears";
import "./Home.css";

class Home extends Component {
    render() {
        return (
            <div className="Home">
                <div id="about">
                    <a href="/About">About</a>
                </div>
                <div id="home">
                    <a href="/Contact">Contact</a>
                </div>

                <div id="projects">
                    <a href="/Projects">Projects</a>
                </div>
                <Gears/>
            </div>
        );
    }
}

export default Home;