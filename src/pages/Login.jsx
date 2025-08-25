import { useEffect, useMemo, useState } from "react";
import { useAuth } from "../context/AuthContext";
import { useLocation, useNavigate } from "react-router-dom";
import { getFriendlyMessage } from "../errors";       // <- parser centralizado
import Alert from "../components/Alert";              // <- alerta reutilizable

export default function Login() {
  const { login, loading, token } = useAuth();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPwd, setShowPwd] = useState(false);
  const [error, setError] = useState("");

  const navigate = useNavigate();
  const location = useLocation();
  const from = useMemo(
    () => location.state?.from?.pathname || "/dashboard",
    [location.state]
  );

  useEffect(() => {
    if (token) navigate(from, { replace: true });
  }, [token, from, navigate]);

  const onSubmit = async (e) => {
    e.preventDefault();
    if (loading) return;

    setError("");
    const emailTrim = email.trim();

    if (!emailTrim || !password) {
      setError("Ingresa email y contraseña.");
      return;
    }

    try {
      const { ok } = await login(emailTrim, password);
      if (ok) navigate(from, { replace: true });
    } catch (err) {
      setError(getFriendlyMessage(err)); 
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-white via-gray-50 to-brand-300/10 flex items-center justify-center p-6">
      <div className="w-full max-w-md rounded-2xl bg-white border border-gray-100 shadow-xl shadow-brand-900/5">
        <div className="p-8">
          <h1 className="text-3xl font-semibold text-gray-900 text-center">
            Iniciar sesión
          </h1>
          <p className="mt-2 text-center text-gray-500 text-sm">
            Bienvenido al sistema de RR.HH. Bworksoft
          </p>

          {error && <Alert className="mt-6 mb-2">{error}</Alert>}

          <form onSubmit={onSubmit} className="mt-6 space-y-5">
            <div>
              <label htmlFor="email" className="block text-sm text-gray-700 mb-1">
                Email
              </label>
              <input
                id="email"
                type="email"
                inputMode="email"
                autoComplete="email"
                className="w-full rounded-xl bg-white text-gray-900 placeholder-gray-400 border border-gray-300 px-4 py-2.5 outline-none focus:ring-2 focus:ring-brand-400 focus:border-brand-400"
                placeholder="admin@demo.cl"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                autoFocus
              />
            </div>

            <div>
              <label htmlFor="password" className="block text-sm text-gray-700 mb-1">
                Contraseña
              </label>
              <div className="relative">
                <input
                  id="password"
                  type={showPwd ? "text" : "password"}
                  autoComplete="current-password"
                  className="w-full rounded-xl bg-white text-gray-900 placeholder-gray-400 border border-gray-300 px-4 py-2.5 pr-24 outline-none focus:ring-2 focus:ring-brand-400 focus:border-brand-400"
                  placeholder="********"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
                <button
                  type="button"
                  onClick={() => setShowPwd((v) => !v)}
                  className="absolute right-2 top-1/2 -translate-y-1/2 rounded-lg px-3 py-1 text-xs font-medium text-gray-600 hover:bg-gray-100"
                  aria-label={showPwd ? "Ocultar contraseña" : "Mostrar contraseña"}
                >
                  {showPwd ? "Ocultar" : "Mostrar"}
                </button>
              </div>
            </div>

            <button
              type="submit"
              disabled={loading}
              className="w-full rounded-xl bg-brand-600 text-white py-2.5 font-semibold hover:bg-brand-500 disabled:opacity-60 transition-colors"
            >
              {loading ? "Ingresando..." : "Entrar"}
            </button>
          </form>

          <p className="text-center text-xs text-gray-400 mt-6">
            © {new Date().getFullYear()} Bworksoft
          </p>
        </div>
      </div>
    </div>
  );
}
