import React, {Component} from 'react';
import {BrowserRouter as Router, Route, Switch} from "react-router-dom";
import './App.css';
import Home from "./Pages/Home/Home";
import About from "./Pages/About/About";
import Contact from "./Pages/Contact/Contact";
import Projects from "./Pages/Projects/Projects";
import Footer from "./components/Footer/Footer";

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <div className="container">
            <Switch>
              <Route exact path="/" component={Home}/>
              <Route exact path="/Contact" component={Contact}/>
              <Route exact path="/About" component={About}/>
              <Route exact path="/Projects" component={Projects}/>
              <Route component={Home}/>
            </Switch>
          </div>
          <div className="footer">
            <Footer/>
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
