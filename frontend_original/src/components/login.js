import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function Login({ onLogin }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();

  const API_BASE_URL = "http://localhost:8080";

  const handleLogin = async (e) => {
    e.preventDefault();
    setError("");
    setIsLoading(true);

    try {
      console.log("Attempting login with:", { email });

      const response = await fetch(`${API_BASE_URL}/api/admin/login`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email: email,
          password: password,
        }),
      });

      console.log("Response received:", response.status);

      if (!response.ok) {
        if (response.status === 401) {
          throw new Error("Invalid email or password");
        } else if (response.status === 404) {
          throw new Error("Server endpoint not found");
        } else {
          throw new Error(`Server responded with status: ${response.status}`);
        }
      }

      const data = await response.json();
      console.log("Response data:", data);

      if (data.token) {
        window.localStorage.setItem("jwtToken", data.token);
        const user = {
          email: email,
          token: data.token,
        };
        window.localStorage.setItem("loggedInUser", JSON.stringify(user));
        onLogin(user);
        navigate("/register");
      } else {
        throw new Error("No token received from server");
      }
    } catch (err) {
      console.error("Login error:", err);
      if (err.message === "Failed to fetch") {
        setError(
          `Unable to connect to server at ${API_BASE_URL}. Please ensure the server is running and try again.`
        );
      } else {
        setError(err.message || "Login failed. Please try again.");
      }
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div style={styles.pageContainer}>
      <div style={styles.container}>
        <h1 style={styles.header}>Admin Login</h1>

        <form onSubmit={handleLogin} style={styles.form}>
          <div style={styles.inputGroup}>
            <label style={styles.label}>Email:</label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              style={styles.input}
              onFocus={(e) => (e.target.style.borderColor = "#007bff")}
              onBlur={(e) => (e.target.style.borderColor = "#cccccc")}
              disabled={isLoading}
              required
              placeholder="Enter your email"
            />
          </div>

          <div style={styles.inputGroup}>
            <label style={styles.label}>Password:</label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              style={styles.input}
              onFocus={(e) => (e.target.style.borderColor = "#007bff")}
              onBlur={(e) => (e.target.style.borderColor = "#cccccc")}
              disabled={isLoading}
              required
              placeholder="Enter your password"
            />
          </div>

          <button
            type="submit"
            disabled={isLoading}
            style={{
              ...styles.button,
              ...(isLoading ? styles.buttonDisabled : {}),
            }}
            onMouseEnter={(e) =>
              !isLoading && (e.target.style.backgroundColor = "#0056b3")
            }
            onMouseLeave={(e) =>
              !isLoading && (e.target.style.backgroundColor = "#007bff")
            }
          >
            {isLoading ? "Logging in..." : "Login"}
          </button>
        </form>

        {error && (
          <div style={styles.errorContainer}>
            <p style={styles.errorText}>{error}</p>
          </div>
        )}
      </div>
    </div>
  );
}

export default Login;

const styles = {
  pageContainer: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    height: "100vh",
    backgroundImage: "url('https://image-static.collegedunia.com/public/college_data/images/appImage/25604_IIITB_APP.jpg?h=260&w=360&mode=crop')",
    backgroundSize: "cover",
    backgroundPosition: "center",
    backgroundRepeat: "no-repeat",
  },
  container: {
    maxWidth: "400px",
    padding: "24px",
    backgroundColor: "#ffffff",
    borderRadius: "8px",
    boxShadow: "0 4px 6px rgba(0, 0, 0, 0.1)",
    border: "2px solid #007bff", // Added border around the form
    width: "100%",
  },
  header: {
    fontSize: "24px",
    fontWeight: "bold",
    marginBottom: "16px",
    textAlign: "center",
    color: "#333333",
  },
  form: {
    display: "flex",
    flexDirection: "column",
    gap: "16px",
  },
  inputGroup: {
    display: "flex",
    flexDirection: "column",
    gap: "8px",
  },
  label: {
    fontSize: "14px",
    fontWeight: "500",
    color: "#555555",
  },
  input: {
    padding: "10px",
    border: "1px solid #cccccc",
    borderRadius: "4px",
    outline: "none",
    fontSize: "14px",
    transition: "border-color 0.3s",
  },
  button: {
    padding: "10px",
    backgroundColor: "#007bff",
    color: "#ffffff",
    fontWeight: "500",
    borderRadius: "4px",
    fontSize: "16px",
    cursor: "pointer",
    transition: "background-color 0.3s",
  },
  buttonDisabled: {
    backgroundColor: "#cccccc",
    cursor: "not-allowed",
  },
  errorContainer: {
    marginTop: "16px",
    padding: "12px",
    backgroundColor: "#ffe5e5",
    borderRadius: "4px",
  },
  errorText: {
    color: "#d32f2f",
    fontSize: "14px",
    textAlign: "center",
  },
};
