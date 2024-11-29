import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
// this ensures that we will be making the stye to place around the react app 
import App from "./App";
/**
 * React-  React is a JavaScript library for building user interfaces, primarily focused on creating reusable UI components. It allows developers to efficiently update and render components based on changes to state and props.
 * The life cycle of react is nothing but:
 * 1.  Mount  - the cmponents are initialised and addded to DOM  constructor() is used for monting the data
 * 2.  Updating - This phase occurs when a component’s state or props change.
 * 3.  Unmounting  -  The component will be remove deom te hdom  OF THR hTML
 * 
 * ReactDOM  - ReactDOM is a package that provides methods for rendering React components to the DOM.
 * creatRoot - it is a place from where everything to be managed in the react.
 * 
 * Props are nothing but javascrit objects, represent a data passed from parent to the child. 
 *  
 */
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    {/* This is used to generate the warnings
        and additional checks for potential problems like 
        deprecated api's etc etc.
    */}
    <App />
  </React.StrictMode>
);
