import { PanelLeftIcon } from "lucide-react";
function Navbar() {
  return (
    <div className="navbar w-full bg-base-300 px-4" role="navigation">
      <label
        htmlFor="my-drawer"
        className="btn btn-square btn-ghost"
        aria-label="open sidebar"
      >
        <PanelLeftIcon className="w-5 h-5" />
      </label>
      <div className="flex-1 px-4">
        <h1 className="text-xl font-bold">Admin Panel</h1>
      </div>
    </div>
  );
}
export default Navbar;
