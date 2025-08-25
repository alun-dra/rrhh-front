import { Routes, Route } from "react-router-dom";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import NotFound from "./pages/NotFound";
import Configuracion from "./pages/Configuracion";
import AfpList from "./pages/config/Afp/AfpList";
import ProtectedRoute from "./components/ProtectedRoute";

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<Login />} />

      <Route
        path="/dashboard"
        element={<ProtectedRoute><Dashboard /></ProtectedRoute>}
      />

      <Route
        path="/configuracion"
        element={<ProtectedRoute><Configuracion /></ProtectedRoute>}
      />

      {/* AFP */}
      <Route
        path="/configuracion/afp"
        element={<ProtectedRoute><AfpList /></ProtectedRoute>}
      />

      {/* TODO: bancos, isapres, mutuales, empresa, etc. */}

      <Route path="*" element={<NotFound />} />
    </Routes>
  );
}
