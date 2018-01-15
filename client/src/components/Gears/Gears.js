import React, { Component } from "react";
import "./Gears.css";
import renderGears from "./renderGears";

class Gears extends Component {
	state = {};

	componentDidMount() {
		renderGears();
	}

	componentDidUpdate() {
		renderGears();
	}

	render() {
		return (
			<div className={"gearsContainer"}></div>
		);
	}
}

export default Gears;