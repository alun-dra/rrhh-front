import { createContext, useContext, useMemo, useState } from "react";
import { loginRequest } from "../services/login";

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [user, setUser] = useState(() => JSON.parse(localStorage.getItem("auth:user") || "null"));
  const [token, setToken] = useState(() => localStorage.getItem("auth:token"));
  const [loading, setLoading] = useState(false);

  const login = async (email, password) => {
    setLoading(true);
    try {
      const data = await loginRequest({ email, password });
      const jwt = data.token || data.access_token;
      const profile = data.user || data;
      localStorage.setItem("auth:token", jwt);
      localStorage.setItem("auth:user", JSON.stringify(profile));
      setToken(jwt);
      setUser(profile);
      return { ok: true };
    } finally {
      setLoading(false);
    }
  };

  const logout = () => {
    localStorage.removeItem("auth:token");
    localStorage.removeItem("auth:user");
    setToken(null);
    setUser(null);
  };

  const value = useMemo(() => ({ user, token, loading, login, logout }), [user, token, loading]);
  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export const useAuth = () => useContext(AuthContext);
