// src/hooks/useAfp.js
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import AfpService from "../services/afp";

export const useAfps = (params) =>
  useQuery({
    queryKey: ["afps", params],
    queryFn: () => AfpService.list(params),
  });

export const useAfp = (id, enabled = true) =>
  useQuery({
    queryKey: ["afps", id],
    queryFn: () => AfpService.get(id),
    enabled: !!id && enabled,
  });

export const useCreateAfp = () => {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (payload) => AfpService.create(payload),
    onSuccess: () => qc.invalidateQueries({ queryKey: ["afps"] }),
  });
};

export const useUpdateAfp = () => {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: ({ id, payload }) => AfpService.update(id, payload),
    onSuccess: (_, { id }) => {
      qc.invalidateQueries({ queryKey: ["afps"] });
      qc.invalidateQueries({ queryKey: ["afps", id] });
    },
  });
};

export const useDeleteAfp = () => {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (id) => AfpService.remove(id),
    onSuccess: () => qc.invalidateQueries({ queryKey: ["afps"] }),
  });
};
