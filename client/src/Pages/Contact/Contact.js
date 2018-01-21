import React, {Component} from "react";
import "./Contact.css";
import NavMenu from "../../components/NavMenu/NavMenu";
import linkedIn from "../../assets/images/linkedInLarge.png";
import gitHub from "../../assets/images/gitHubLarge.png";

class Contact extends Component {
    render() {
        return (
            <div className="Contact">
                <NavMenu/>
                <h1>Contact</h1>
                <div className="contactText">

                    <div className="socialLinks">
                        <a target="_blank" rel="noopener noreferrer"  href="https://github.com/psd314"><img className="social" src={gitHub} alt="git hub logo"/></a>
                        <a target="_blank" rel="noopener noreferrer"  href="https://www.linkedin.com/in/philippe-dixon/"><img className="social" src={linkedIn} alt="linked in logo"/></a>
                    </div>

                    <p>
                        <a href="mailto:philippedixon@protonmail.com">
                            <i className="fa fa-envelope-o" aria-hidden="true"></i>
                            &nbsp;philippedixon@protonmail.com</a>
                    </p>
                    <p>
                        <a href="tel:413-695-0002">
                            <i className="fa fa-phone" aria-hidden="true"></i>
                            &nbsp;(413) 695-0002</a>
                    </p>
                </div>
            </div>
        );
    }
};

export default Contact;