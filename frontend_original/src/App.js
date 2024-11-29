import "./App.css";
import React, { useState, useEffect } from "react";
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
// browserRoueter is mainly used for that enables client-side routing, allowing you to manage navigation within the app without reloading the page.
/*
Routes is a container component that holds all the Route components in a React application. It is used to match the current URL with the corresponding route and render the correct component based on the path.

Route:
Route defines the mapping between a URL path and a component. It renders a specific component when the URL matches the path prop. It can be used with exact (now implied) to match exact URLs.
*/
import RegistrationForm from "./components/registration";
//2nd page 
//This is used to handle the faculty registration where the faculty details is filed
import Login from "./components/login";
//first page
import CourseForm from "./components/courseRegistration";
//this is the 3rd page , where we have keep the list os seleceted data
import registerService from "./services/register";
//when you click on the register in the second age, this is used to post the data to tis

import { confirmAlert } from "react-confirm-alert";

function App() {
  const [userData, setUserData] = useState(null);
  // created a userData variable initailised to null

  /*The handle register is a async function, when this is called,
   It will have to pass the parameter which is having the whole  data in it. 

  */
  const handleRegister = async (details) => {
    try {
      const userObject = await registerService.register(details);
      // till the re
      if (!userObject) {
        setUserData(null);
        alertBox("Email id already exists");
        return;
      }
      setUserData(userObject);
      window.localStorage.setItem("loggedInUser", JSON.stringify(userObject));
      // return userData;
      return true; 
    } catch (exception) {
      alertBox("Choose correct department ");
      return false;
    }
  };

  const alertBox = (message) => {
    confirmAlert({
      title: "Notification",
      message: message,
      buttons: [
        {
          label: "Ok",
          onClick: () => {
            const currList = window.localStorage.getItem("currentList");
            const courseList = window.localStorage.getItem("courseList");
            if (currList || courseList?.length === 2) {
              window.localStorage.removeItem("loggedInUser");
              window.localStorage.removeItem("courseList");
            }
          },
        },
      ],
    });
  };

  const handleSubmit = () => {
    const currList = window.localStorage.getItem("currentList");
    const courseList = window.localStorage.getItem("courseList");
    //setSelectedList(currList)
    console.log(courseList.length);

    if (courseList.length === 2) {
      alertBox("No course available");
      setUserData(null);
    } else if (currList === null) {
      alertBox("You have not selected any course");
      // setIsSubmit(false)
    } else {
      alertBox("Course(s) have been added successfully!");
      // window.localStorage.removeItem('currentList')
      // window.localStorage.removeItem('loggedInUser')
      setUserData(null);
      // setIsSubmit(true)
    }
  };

  useEffect(() => {
    const loggedInUser = window.localStorage.getItem("loggedInUser");
    if (loggedInUser) setUserData(JSON.parse(loggedInUser));
  }, []);

  return (
    <Router>
      <div className="App">
        <Routes>
          {/* Login Page */}
          <Route
            path="/login"
            element={<Login onLogin={(user) => setUserData(user)} />}
          />

          {/* Registration Page */}
          <Route
            path="/register"
            element={
              userData ? (
                <RegistrationForm startRegister={handleRegister} />
              ) : (
                <Navigate to="/login" />
              )
            }
          />

          {/* Course Registration */}
          <Route
            path="/courses"
            element={
              userData ? (
                <>
                <CourseForm userData={userData} />
                <div>
                  <button onClick={handleSubmit}>SUBMIT</button>
                </div>
                </>
              ) : (
                <Navigate to="/login" />
              )
            }
          />

          {/* Default Route */}
          <Route path="*" element={<Navigate to="/login" />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
