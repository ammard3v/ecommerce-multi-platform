import {
  ShoppingBagIcon,
  HomeIcon,
  ClipboardListIcon,
  UsersIcon,
  LogOutIcon,
  BellIcon,
} from "lucide-react";
import { Link, useLocation } from "react-router-dom";
export const NAVIGATION = [
  {
    name: "Dashboard",
    path: "/admin",
    icon: <HomeIcon className="w-5 h-5" />,
  },
  {
    name: "Products",
    path: "/admin/products",
    icon: <ShoppingBagIcon className="w-5 h-5" />,
  },
  {
    name: "Orders",
    path: "/admin/orders",
    icon: <ClipboardListIcon className="w-5 h-5" />,
  },
  {
    name: "Notifications",
    path: "/admin/notifications",
    icon: <BellIcon className="w-5 h-5" />,
  },
  {
    name: "Users",
    path: "/admin/users",
    icon: <UsersIcon className="w-5 h-5" />,
  },
];
function Sidebar() {
  const location = useLocation();
  const handleLogout = () => {
    localStorage.clear();
    sessionStorage.clear();
    window.location.href = "/login";
  };
  return (
    <div className="drawer-side">
      <label htmlFor="my-drawer" className="drawer-overlay"></label>
      <div className="flex flex-col w-64 min-h-screen bg-base-200">
        <div className="p-4 flex items-center gap-3">
          <div className="w-10 h-10 bg-primary rounded-xl flex items-center justify-center">
            <ShoppingBagIcon className="w-6 h-6 text-primary-content" />
          </div>
          <span className="text-xl font-bold">eShop</span>
        </div>
        <ul className="menu flex-1 p-2 gap-2">
          {NAVIGATION.map((item) => {
            const isActive = location.pathname === item.path;
            return (
              <li key={item.path}>
                <Link
                  to={item.path}
                  className={`flex items-center gap-2 px-3 py-2 rounded ${
                    isActive
                      ? "bg-primary text-primary-content"
                      : "hover:bg-base-300"
                  }`}
                >
                  {item.icon}
                  <span>{item.name}</span>
                </Link>
              </li>
            );
          })}
        </ul>
        <div className="p-4 border-t">
          <button
            onClick={handleLogout}
            className="flex items-center gap-2 w-full px-3 py-2 rounded hover:bg-red-500 hover:text-white transition"
          >
            <LogOutIcon className="w-5 h-5" />
            <span>Logout</span>
          </button>
        </div>
      </div>
    </div>
  );
}
export default Sidebar;
