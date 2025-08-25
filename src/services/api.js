// src/services/api.js
import axios from "axios";
import { getFriendlyMessage } from "../errors"; // <- parser centralizado

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
  timeout: 10000, // opcional: 10s timeout
});

// REQUEST INTERCEPTOR
api.interceptors.request.use(
  (config) => {
    const name = import.meta.env.VITE_API_KEY_HEADER || "x-api-key";
    const key = (import.meta.env.VITE_API_KEY ?? "").toString().trim();

    if (key) {
      config.headers[name] = key;
      config.headers["x-api-key"] = key; // redundante, por si acaso
    }

    const token = localStorage.getItem("auth:token");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }

    return config;
  },
  (error) => Promise.reject(error)
);

// RESPONSE INTERCEPTOR
api.interceptors.response.use(
  (response) => response,
  (error) => {
    // Transformar mensaje antes de propagar
    const e = error;
    e.message = getFriendlyMessage(error);
    return Promise.reject(e);
  }
);

export default api;
