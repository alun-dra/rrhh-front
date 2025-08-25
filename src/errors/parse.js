// src/errors/parse.js
import { STATUS_MESSAGES, BACKEND_TEXT_MAP } from "./messages";

export function getFriendlyMessage(err) {
  // axios error?
  const status = err?.response?.status;
  const backendMsg =
    err?.response?.data?.message ||
    err?.response?.data?.error ||
    err?.response?.data?.msg;

  const originalMsg = backendMsg || err?.message || "";

  // Mapear por texto conocido del backend
  if (backendMsg) {
    const hit = BACKEND_TEXT_MAP.find(({ match }) => match.test(backendMsg));
    if (hit) return hit.to;
  }

  // Mapear por status
  if (status && STATUS_MESSAGES[status]) {
    // Si es 401 con credenciales -> mensaje más claro
    if (status === 401 && /password|credenciales|login/i.test(originalMsg)) {
      return "Email o contraseña incorrectos.";
    }
    return STATUS_MESSAGES[status];
  }

  // Problemas de red / CORS / server caído
  if (originalMsg && /network|fetch|failed|timeout|abort/i.test(originalMsg)) {
    return "No se pudo conectar con el servidor. Reintenta en unos segundos.";
  }

  // Fallback genérico
  return "Ocurrió un error. Intenta nuevamente.";
}
