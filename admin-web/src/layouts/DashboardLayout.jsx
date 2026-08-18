import { Outlet } from "react-router-dom";
import Navbar from "../components/Navbar";
import Sidebar from "../components/Sidebar";
function DashboardLayout() {
  return (
    <div className="drawer lg:drawer-open">
      <input id="my-drawer" type="checkbox" className="drawer-toggle" />
      <div className="drawer-content flex flex-col min-h-screen">
        <Navbar />
        <main className="p-6 flex-1 bg-base-100">
          <Outlet />
        </main>
      </div>
      <Sidebar />
    </div>
  );
}
export default DashboardLayout;
