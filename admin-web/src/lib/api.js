import axiosInstance from "./axios";
export const authApi = {
  signIn: async (email, password) => {
    try {
      const response = await axiosInstance.post("auth/signIn", {
        email: email.trim(),
        password,
      });
      if (
        (response.status === 200 || response.status === 201) &&
        response.data?.status === "success" &&
        response.data?.data?.access_token
      ) {
        const user = response.data.data;
        if (user.role !== "admin") {
          throw new Error("You do not have permission to login");
        }
        const adminEmail = import.meta.env.VITE_ADMIN_EMAIL;
        if (adminEmail && user.email !== adminEmail) {
          throw new Error("You do not have permission to login");
        }
        return user.access_token;
      }
      throw new Error(response.data?.message || "Login failed.");
    } catch (err) {
      const msg =
        err?.response?.data?.message || err?.message || "Something went wrong";
      throw new Error(msg);
    }
  },
};
export const productApi = {
  getAll: async () => {
    const { data } = await axiosInstance.get("/products");
    return data;
  },
  create: async (formData) => {
    const { data } = await axiosInstance.post("/products", formData);
    return data;
  },
  update: async ({ id, formData }) => {
    const { data } = await axiosInstance.put(`/products/${id}`, formData);
    return data;
  },
  delete: async (productId) => {
    const { data } = await axiosInstance.delete(`/products/${productId}`);
    return data;
  },
};
export const categoryApi = {
  getAll: async () => {
    const { data } = await axiosInstance.get("/categories");
    return data;
  },
};
export const notificationApi = {
  getAll: async () => {
    const { data } = await axiosInstance.get("/notification");
    return data;
  },
  sendToAll: async (payload) => {
    const { data } = await axiosInstance.post(
      "/notification/send-all",
      payload,
    );
    return data;
  },
};
export const orderApi = {
  getAll: async () => {
    try {
      const response = await axiosInstance.get("/orders/getAllOrders");
      console.log("Orders API full response:", response.data);
      const orders = response.data?.data || [];
      console.log("Extracted orders:", orders);
      return orders;
    } catch (error) {
      console.error("Error fetching orders:", error);
      return [];
    }
  },
  updateStatus: async ({ orderId, status }) => {
    const { data } = await axiosInstance.post(`/orders/${orderId}`, {
      status,
    });
    return data;
  },
};
export const statsApi = {
  getDashboard: async () => {
    try {
      const { data } = await axiosInstance.get("/products/product-stats");
      return data?.data?.stats || {};
    } catch (err) {
      console.error("Failed to fetch product dashboard stats:", err);
      return {};
    }
  },
};
export const usersApi = {
  getAll: async () => {
    const { data } = await axiosInstance.get("/users/");
    return data;
  },
  disable: async (id) => {
    return axiosInstance.delete(`/users/${id}`);
  },
  enable: async (id) => {
    return axiosInstance.patch(`/users/active/${id}`);
  },
};
