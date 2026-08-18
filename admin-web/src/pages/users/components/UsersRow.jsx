import { useState } from "react";
import { formatDate } from "../../../lib/utils";
export const UsersRow = ({ user, onDisable, onEnable }) => {
  const [isToggling, setIsToggling] = useState(false);
  const handleToggle = async (e) => {
    const next = e.target.checked;
    setIsToggling(true);
    try {
      if (next) {
        await onEnable(user.id);
      } else {
        await onDisable(user.id);
      }
    } finally {
      setIsToggling(false);
    }
  };
  return (
    <tr className={!user.active ? "opacity-70" : ""}>
      <td className="flex items-center gap-3">
        <div className="avatar placeholder">
          <div className="bg-primary text-primary-content rounded-full w-12 h-12 flex items-center justify-center">
            {user.name?.[0] || "U"}
          </div>
        </div>
        <div className="font-semibold">{user.name || "N/A"}</div>
      </td>
      <td>{user.email || "-"}</td>
      <td>
        <span className="text-sm opacity-60">
          {formatDate(user.created_at || user.createdAt)}
        </span>
      </td>
      <td>
        <span
          className={`px-2 py-1 rounded-full text-white text-sm font-medium ${
            user.active ? "bg-green-500" : "bg-yellow-500"
          }`}
        >
          {user.active ? "Active" : "Inactive"}
        </span>
      </td>
      <td className="flex gap-3 items-center">
        {user.role !== "admin" ? (
          <>
            <input
              type="checkbox"
              className="toggle toggle-sm"
              checked={user.active}
              onChange={handleToggle}
              disabled={isToggling}
            />
          </>
        ) : (
          <span className="badge badge-info">Admin</span>
        )}
      </td>
    </tr>
  );
};
