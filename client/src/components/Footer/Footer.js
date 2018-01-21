import React from "react";
import linkedIn from "../../assets/images/linkedIn.png";
import gitHub from "../../assets/images/gitHub.png";

const Footer = () => {
    return (
        <footer>
            <div className="footerWrapper">
                <a target="_blank" rel="noopener noreferrer" href="https://github.com/psd314"><img className="logos" height= "21px" width="21px" src={gitHub} alt="git hub logo" /></a>
                <a target="_blank" rel="noopener noreferrer" href="https://www.linkedin.com/in/philippe-dixon/"><img className="logos" src={linkedIn} alt="linked in logo" /></a>
                <span>&copy; Philippe Dixon - 2018</span>
            </div>
        </footer>
    );
}

export default Footer;