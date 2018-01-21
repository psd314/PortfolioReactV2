import React, {Component} from "react";
import "./About.css";
import logo from "../../assets/images/philippe_dixon_profile_pic.png";
import NavMenu from "../../components/NavMenu/NavMenu";

class About extends Component {
    render() {
        return (
            <div className="About">
                <NavMenu/>
                <h1>About</h1>
                <div className="photoBox">
                    <img className="photo" src={logo} alt="me"/>
                </div>

                <div className="aboutText">
                    <p>
                        I'm a full stack web developer and an artificial intelligence enthusiast
                        specializing in the MERN stack (MongoDB / MySQL, Express, React, Node).
                    </p>
                    <br/>
                    <p>
                        I build and deploy full stack SPA's (Single Page Applications) and am available
                        for freelance work.
                    </p>
                    <br/>
                    <p>
                        In my free time I try my hand at competitive coding and machine learning on
                        sites like HackerRank and Kaggle. I enjoy traveling and staying in shape with
                        CrossFit and Brazilian Jiu Jitsu.
                    </p>
                    <div className="credits">
                        <p>&nbsp;<strong>Credits:
                            </strong>This page was built using React, React Router and D3.js. Background
                            image courtesy of 
                            <a target="_blank" rel="noopener noreferrer"  href="https://www.pexels.com"> Pexels.com.</a>&nbsp; D3 Epicycle Gears base code from
                            <a target="_blank" rel="noopener noreferrer"  href="https://bl.ocks.org/mbostock"> Mike Bostock.</a>
                        </p>
                    </div>
                </div>
            </div>
        );
    };
}

export default About;