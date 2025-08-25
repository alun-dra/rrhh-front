import Layout from "../components/Layout";
import Alert from "../components/Alert";
import { useApiQuery } from "../hooks/useApiQuery";
import { useAuth } from "../context/AuthContext";


export default function Dashboard() {
  const { token } = useAuth();
  const { data, isLoading, error } = useApiQuery({
    key: ["me"],
    url: "/auth/me",
    enabled: !!token,
  });

  return (
    <Layout>
      <div className="space-y-4">
        <h2 className="text-xl font-semibold text-gray-900">Dashboard</h2>

        {isLoading && <div className="text-sm text-gray-500">Cargando…</div>}
        {error && <Alert>{error.message}</Alert>}

        {data && (
          <div className="rounded-xl bg-white border border-gray-200 p-4">
            <p className="text-sm text-gray-700">
              Bienvenido, <span className="font-medium">{data.user?.username}</span>
            </p>
            <p className="text-xs text-gray-500 mt-1">
              Rol: {data.role} • Último acceso: {new Date(data.user?.last_login).toLocaleString()}
            </p>
          </div>
        )}
      </div>
    </Layout>
  );
}
