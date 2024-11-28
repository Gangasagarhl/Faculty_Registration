import React from "react";

const NavBar = ({ user, setUser }) => {
  // If the Logout button has been clicked then clear the loggedInUser object from localStorage and
  // update "user" state to null, in order to logout, otherwise on the next reload, the Effect hook will again read the user
  // from the localStorage and relogin without showing the login form
  const logout = () => {
    window.localStorage.removeItem("loggedInUser");
    window.localStorage.removeItem("currentList");
    setUser(null);
  };

  // Prevents Key Exception errors if "user" state hasn't loaded yet
  // if (!user)
  //     return null

  return (
    <div>
      <button onClick={logout}>Logout</button>
    </div>
  );
};

export default NavBar;
