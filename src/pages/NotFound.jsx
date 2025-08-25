import { Link } from "react-router-dom";

export default function NotFound() {
  return (
    <div className="min-h-screen grid place-items-center">
      <div className="text-center">
        <h1 className="text-5xl font-bold">404</h1>
        <p className="mt-2 text-gray-600">Página no encontrada</p>
        <Link to="/" className="inline-block mt-6 underline">Volver al inicio</Link>
      </div>
    </div>
  );
}
