// src/components/ProtectedRoute.jsx
import { Navigate, useLocation } from "react-router-dom";
import { useAuth } from "../context/AuthContext";

export default function ProtectedRoute({ children }) {
  const { token, loading } = useAuth();
  const location = useLocation();
  if (loading) return null; // o un spinner
  if (!token) return <Navigate to="/login" replace state={{ from: location }} />;
  return children; // <- MUY IMPORTANTE
}
