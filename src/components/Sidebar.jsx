// src/components/Sidebar.jsx
import { NavLink, useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import {
  Home,
  Users,
  Building2,
  FileText,
  Clock,
  Receipt,
  SlidersHorizontal,
  Settings,
  LogOut,
} from "lucide-react";

const items = [
  { to: "/dashboard", label: "Inicio", icon: Home },
  { to: "/personas", label: "Personas", icon: Users },
  { to: "/empresas", label: "Empresas", icon: Building2 },
  { to: "/contratos", label: "Contratos", icon: FileText },
  { to: "/asistencia", label: "Asistencia", icon: Clock },
  { to: "/liquidaciones", label: "Liquidaciones", icon: Receipt },
  { to: "/parametros", label: "Parámetros", icon: SlidersHorizontal },
  { to: "/configuracion", label: "Configuración", icon: Settings },
];

export default function Sidebar({ open, onClose }) {
  const navigate = useNavigate();
  const { logout, user } = useAuth();

  // Fallback por si no viene el user en contexto
  const displayName =
    user?.nombres || user?.username || user?.email_persona || user?.email || "Usuario";
  const displayEmail =
    user?.email_persona || user?.email_usuario || user?.email || "";

  const base =
    "flex items-center gap-3 px-3 py-2 rounded-lg text-sm font-medium transition-colors";
  const active = "bg-white text-brand-900";
  const inactive = "text-brand-100/80 hover:bg-brand-800 hover:text-white";

  // Avatar con iniciales
  const initials = (displayName || "")
    .split(" ")
    .slice(0, 2)
    .map((s) => s[0])
    .join("")
    .toUpperCase();

  return (
    <>
      {/* Overlay mobile */}
      <div
        onClick={onClose}
        className={`fixed inset-0 bg-black/40 lg:hidden transition-opacity ${
          open ? "opacity-100 pointer-events-auto" : "opacity-0 pointer-events-none"
        }`}
      />

      <aside
        className={`fixed z-40 top-0 left-0 h-full w-72 bg-brand-900 text-white border-r border-white/10
        transform transition-transform lg:translate-x-0 ${
          open ? "translate-x-0" : "-translate-x-full"
        }`}
      >
        {/* Contenedor vertical */}
        <div className="h-full flex flex-col">
          {/* Brand */}
          <div className="h-16 flex items-center px-4 border-b border-white/10">
            <span className="text-lg font-semibold">Bworksoft</span>
          </div>

          {/* Navegación (scrollable) */}
          <nav className="p-3 space-y-1 overflow-y-auto flex-1">
            {items.map(({ to, label, icon: Icon }) => (
              <NavLink
                key={to}
                to={to}
                className={({ isActive }) => `${base} ${isActive ? active : inactive}`}
                onClick={onClose}
              >
                <Icon size={18} />
                <span>{label}</span>
              </NavLink>
            ))}
          </nav>

          {/* Footer: usuario + logout */}
          <div className="border-t border-white/10 p-3">
            <div className="flex items-center gap-3 px-2">
              <div className="grid place-items-center w-10 h-10 rounded-full bg-gradient-to-br from-brand-500 to-brand-300 text-brand-950 font-bold">
                {initials || "U"}
              </div>
              <div className="min-w-0">
                <p className="text-sm font-medium truncate">{displayName}</p>
                {displayEmail && (
                  <p className="text-xs text-brand-200/80 truncate">{displayEmail}</p>
                )}
              </div>
            </div>

            <button
              onClick={() => {
                logout();
                navigate("/", { replace: true });
              }}
              className="mt-3 w-full inline-flex items-center justify-center gap-2 rounded-lg px-3 py-2 text-sm font-medium
                         bg-brand-800 hover:bg-brand-700 text-white transition-colors"
            >
              <LogOut size={16} />
              Cerrar sesión
            </button>

            <div className="mt-3 text-[10px] text-brand-200/60 px-2">
              © {new Date().getFullYear()} Bworksoft
            </div>
          </div>
        </div>
      </aside>
    </>
  );
}
