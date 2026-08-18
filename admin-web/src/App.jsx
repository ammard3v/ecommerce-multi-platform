import { useState, useEffect } from "react";
import { Navigate, Route, Routes } from "react-router-dom";
import LoginPage from "./pages/login/LoginPage";
import DashboardPage from "./pages/dashboard/DashboardPage";
import NotificationPage from "./pages/notifications/NotificationPage";
import ProductsPage from "./pages/products/ProductsPage";
import OrdersPage from "./pages/orders/OrdersPage";
import UsersPage from "./pages/users/UsersPage";
import DashboardLayout from "./layouts/DashboardLayout";
function App() {
  const [token, setToken] = useState(localStorage.getItem("access_token"));
  useEffect(() => {
    const handleStorage = () => {
      setToken(localStorage.getItem("access_token"));
    };
    window.addEventListener("storage", handleStorage);
    return () => window.removeEventListener("storage", handleStorage);
  }, []);
  return (
    <Routes>
      <Route
        path="/login"
        element={
          !token ? (
            <LoginPage setToken={setToken} />
          ) : (
            <Navigate to="/admin" replace />
          )
        }
      />
      <Route
        path="/admin/*"
        element={token ? <DashboardLayout /> : <Navigate to="/login" replace />}
      >
        <Route index element={<DashboardPage />} />
        <Route path="products" element={<ProductsPage />} />
        <Route path="orders" element={<OrdersPage />} />
        <Route path="notifications" element={<NotificationPage />} />
        <Route path="users" element={<UsersPage />} />
      </Route>
      <Route
        path="*"
        element={<Navigate to={token ? "/admin" : "/login"} replace />}
      />
    </Routes>
  );
}
export default App;
