import React, {Component} from "react";
import { Link } from 'react-router-dom';
import Gears from "../../components/Gears/Gears";
import "./Home.css";

class Home extends Component {
    render() {
        return (
            <div className="Home">
                <div id="about">
                    <Link to="/About">About</Link>
                </div>
                <div id="home">
                    <Link to="/Contact">Contact</Link>
                </div>

                <div id="projects">
                    <Link to="/Projects">Projects</Link>
                </div>
                <Gears/>
            </div>
        );
    }
}

export default Home;