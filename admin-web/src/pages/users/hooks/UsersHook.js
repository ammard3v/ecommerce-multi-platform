import { useState, useEffect } from "react";
import { usersApi } from "../../../lib/api";
export const useUsers = () => {
  const [users, setUsers] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const fetchUsers = async () => {
    setIsLoading(true);
    try {
      const data = await usersApi.getAll();
      if (data.status === "success") {
        setUsers(data.data);
      } else {
        setUsers([]);
      }
    } catch (err) {
      console.error(err);
      setUsers([]);
    } finally {
      setIsLoading(false);
    }
  };
  const disableUser = async (id) => {
    try {
      await usersApi.disable(id);
      setUsers((prev) =>
        prev.map((u) => (u.id === id ? { ...u, active: false } : u)),
      );
      return true;
    } catch (err) {
      console.error(err);
      return false;
    }
  };
  const enableUser = async (id) => {
    try {
      const res = await usersApi.enable(id);
      const updatedUser = res.data.data;
      setUsers((prev) =>
        prev.map((u) => (u.id === updatedUser.id ? updatedUser : u)),
      );
      return true;
    } catch (err) {
      console.error(err);
      return false;
    }
  };
  useEffect(() => {
    fetchUsers();
  }, []);
  return {
    users,
    isLoading,
    disableUser,
    enableUser,
  };
};
