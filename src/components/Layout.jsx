import { useState } from "react";
import Sidebar from "./Sidebar";
import Topbar from "./Topbar";

export default function Layout({ children }) {
  const [open, setOpen] = useState(false);

  return (
    <div className="min-h-screen bg-gray-50">
      <Sidebar open={open} onClose={() => setOpen(false)} />

      {/* contenido */}
      <div className="lg:pl-72">
        <Topbar onMenu={() => setOpen(true)} />
        <main className="p-6">{children}</main>
      </div>
    </div>
  );
}
