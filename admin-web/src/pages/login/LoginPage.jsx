import { useState } from "react";
import { useNavigate } from "react-router-dom";
import LoginForm from "./LoginForm.jsx";
import { authApi } from "../../lib/api.js";
function LoginPage({ setToken }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();
  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage("");
    setIsLoading(true);
    try {
      const access_token = await authApi.signIn(email, password);
      localStorage.setItem("access_token", access_token);
      setToken(access_token);
      navigate("/dashboard", { replace: true });
    } catch (error) {
      const msg = error?.message || "Login failed";
      setMessage(msg);
    } finally {
      setIsLoading(false);
    }
  };
  return (
    <div className="min-h-screen flex items-center justify-center bg-white px-4">
      <div className="w-full max-w-sm bg-gray-100 border border-gray-300 rounded-2xl p-8">
        <div className="text-center mb-8">
          <h1 className="text-2xl font-semibold text-black">Welcome Back</h1>
        </div>
        <LoginForm
          email={email}
          password={password}
          setEmail={setEmail}
          setPassword={setPassword}
          handleSubmit={handleSubmit}
          message={message}
          isLoading={isLoading}
        />
      </div>
    </div>
  );
}
export default LoginPage;
