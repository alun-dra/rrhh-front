// src/hooks/useApiMutation.js
import { useMutation, useQueryClient } from "@tanstack/react-query";
import api from "../services/api";

/**
 * Wrapper de useMutation para crear/editar/eliminar recursos.
 *
 * @param {Object} options
 * @param {'post'|'put'|'patch'|'delete'} [options.method='post']
 * @param {string} options.url                      - endpoint base (p.ej. '/empresa')
 * @param {Array<string|array>} [options.invalidate]- lista de queryKeys a invalidar tras éxito
 * @param {function} [options.onSuccess]            - callback adicional de éxito
 * @param {function} [options.onError]              - callback adicional de error
 *
 * Uso:
 * const { mutate, isPending } = useApiMutation({
 *   method: 'post',
 *   url: '/empresa',
 *   invalidate: [['empresas']],
 * })
 * mutate(payload)
 */
export function useApiMutation({
  method = "post",
  url,
  invalidate = [],
  onSuccess,
  onError,
}) {
  const qc = useQueryClient();

  return useMutation({
    mutationFn: async (payload) => {
      switch (method) {
        case "post": {
          const { data } = await api.post(url, payload);
          return data;
        }
        case "put": {
          const { data } = await api.put(url, payload);
          return data;
        }
        case "patch": {
          const { data } = await api.patch(url, payload);
          return data;
        }
        case "delete": {
          // si necesitas /recurso/:id, arma la URL fuera y pásala en url
          const { data } = await api.delete(url, { data: payload });
          return data;
        }
        default:
          throw new Error(`Método no soportado: ${method}`);
      }
    },
    onSuccess: (data, variables, context) => {
      // Invalidar queries indicadas
      invalidate.forEach((k) => {
        const key = Array.isArray(k) ? k : [k];
        qc.invalidateQueries({ queryKey: key });
      });
      onSuccess?.(data, variables, context);
    },
    onError,
  });
}
