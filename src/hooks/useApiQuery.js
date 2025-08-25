// src/hooks/useApiQuery.js
import { useQuery } from "@tanstack/react-query";
import api from "../services/api";

/**
 * Wrapper de useQuery para peticiones GET a tu API (axios).
 *
 * @param {Object} options
 * @param {string|array} options.key      - clave o array para el cache (p.ej. ['empresas', params])
 * @param {string} options.url            - endpoint (p.ej. '/empresa')
 * @param {Object} [options.params]       - query params
 * @param {boolean} [options.enabled=true]- habilitar/inhabilitar la query
 * @param {function} [options.select]     - transformador de la data
 * @param {number} [options.staleTime]    - override por query
 */
export function useApiQuery({
  key,
  url,
  params,
  enabled = true,
  select,
  staleTime,
}) {
  const queryKey = Array.isArray(key) ? key : [key];

  return useQuery({
    queryKey,
    queryFn: async () => {
      const { data } = await api.get(url, { params });
      return data;
    },
    enabled,
    select,
    staleTime,
  });
}
