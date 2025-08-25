// src/lib/queryClient.js
import { QueryClient } from "@tanstack/react-query";

/**
 * Config global de React Query.
 * Ajusta a gusto: políticas de reintentos, cache, revalidación, etc.
 */
export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: 1,                   // reintenta 1 vez
      refetchOnWindowFocus: false,
      refetchOnReconnect: true,
      staleTime: 60 * 1000,       // 1 min
      gcTime: 5 * 60 * 1000,      // 5 min (GC antes: cacheTime)
    },
    mutations: {
      retry: 0,                   // mutaciones sin reintentos por defecto
    },
  },
});
