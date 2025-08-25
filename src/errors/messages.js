// src/errors/messages.js
export const STATUS_MESSAGES = {
  400: "Solicitud inválida.",
  401: "Sesión no autorizada. Verifica tus credenciales.",
  403: "Acceso restringido.",
  404: "Recurso no encontrado.",
  408: "Tiempo de espera agotado.",
  429: "Demasiadas solicitudes. Intenta más tarde.",
  500: "Error interno del servidor.",
  502: "El servidor no responde correctamente.",
  503: "Servicio no disponible.",
  504: "Tiempo de espera agotado en el servidor.",
};

// Si tu backend envía textos concretos, mapea a algo más claro:
export const BACKEND_TEXT_MAP = [
  { match: /api key inválida/i, to: "Error de autenticación del servicio. (API key)" },
  { match: /invalid credentials|credenciales inválidas/i, to: "Email o contraseña incorrectos." },
  { match: /usuario.*inactivo/i, to: "Tu usuario está inactivo. Contacta al administrador." },
];
