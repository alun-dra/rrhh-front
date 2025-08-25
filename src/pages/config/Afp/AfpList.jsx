import { useState, useMemo } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { Pencil, Trash2 } from "lucide-react";

import Layout from "../../../components/Layout";
import TableSimple from "../../../components/TableSimple";
import Modal from "../../../components/Modal";
import Confirm from "../../../components/Confirm";
import Alert from "../../../components/Alert";
import Breadcrumb from "../../../components/Breadcrumb";

import AfpForm from "./AfpForm";
import AfpService from "../../../services/afp";

export default function AfpList() {
  const [openForm, setOpenForm] = useState(false);
  const [editing, setEditing] = useState(null);
  const [toDelete, setToDelete] = useState(null);
  const [filter, setFilter] = useState("");

  const qc = useQueryClient();

  // GET /afp  (normalizamos: rows = data?.data ?? [])
  const { data, isLoading, error } = useQuery({
    queryKey: ["afp", { q: filter }],
    queryFn: () => AfpService.list(filter ? { q: filter } : {}),
  });
  const rows = data?.data ?? [];

  // POST /afp
  const { mutate: createAfp, isPending: creating, error: createError } =
    useMutation({
      mutationFn: (payload) => AfpService.create(payload),
      onSuccess: () => {
        qc.invalidateQueries({ queryKey: ["afp"] });
        setOpenForm(false);
      },
    });

  // PUT /afp/:id
  const { mutate: updateAfp, isPending: updating, error: updateError } =
    useMutation({
      mutationFn: ({ id, payload }) => AfpService.update(id, payload),
      onSuccess: () => {
        qc.invalidateQueries({ queryKey: ["afp"] });
        setOpenForm(false);
      },
    });

  // DELETE /afp/:id
  const { mutate: deleteAfp, isPending: deleting, error: deleteError } =
    useMutation({
      mutationFn: (id) => AfpService.remove(id),
      onSuccess: () => {
        qc.invalidateQueries({ queryKey: ["afp"] });
        setToDelete(null);
      },
    });

  const columns = useMemo(
    () => [
      { key: "id", header: "ID", width: "80px" },
      { key: "nombre", header: "Nombre" },
      {
        key: "codigo_suseso",
        header: "Código SUSESO",
        width: "160px",
        render: (v) => (v ? String(v).toUpperCase() : "-"),
      },
      {
        key: "tasa_comision",
        header: "Comisión (%)",
        width: "140px",
        render: (v) => {
          const n = Number(v);
          if (Number.isNaN(n)) return "-";
          return `${(n * 100).toFixed(2)} %`;
        },
      },
    ],
    []
  );

  const onCreate = (payload) => createAfp(payload);
  const onUpdate = (id, payload) => updateAfp({ id, payload });
  const onDelete = (id) => deleteAfp(id);

  return (
    <Layout>
      <div className="max-w-5xl mx-auto space-y-4">
        {/* Breadcrumb */}
        <Breadcrumb
          items={[
            { label: "Configuración", to: "/configuracion" },
            { label: "AFP" },
          ]}
        />

        {/* Encabezado */}
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-xl font-semibold text-gray-900">AFP</h2>
            <p className="text-sm text-gray-500">Fondos de pensión y tasas.</p>
          </div>
          <button
            onClick={() => {
              setEditing(null);
              setOpenForm(true);
            }}
            className="rounded-lg bg-brand-600 text-white px-3 py-2 text-sm font-medium hover:bg-brand-500"
          >
            Nueva AFP
          </button>
        </div>

        {(error || createError || updateError || deleteError) && (
          <Alert>
            {(error || createError || updateError || deleteError)?.message}
          </Alert>
        )}

        {/* Filtro */}
        <div className="flex items-center gap-2">
          <input
            className="w-full sm:w-64 rounded-lg border border-gray-300 px-3 py-2 text-sm outline-none focus:ring-2 focus:ring-brand-400"
            placeholder="Buscar por nombre…"
            value={filter}
            onChange={(e) => setFilter(e.target.value)}
          />
        </div>

        {/* Tabla */}
        <TableSimple
          loading={isLoading}
          columns={columns}
          rows={rows}
          rowKey={(r) => r.id}
          onEdit={(row) => {
            setEditing(row);
            setOpenForm(true);
          }}
          onDelete={(row) => setToDelete(row)}
          renderActions={(row) => (
            <div className="flex items-center justify-end gap-2">
              <button
                onClick={() => {
                  setEditing(row);
                  setOpenForm(true);
                }}
                className="inline-flex items-center gap-1 rounded-md px-2 py-1 text-xs font-medium text-brand-700 hover:bg-brand-50"
                title="Editar"
              >
                <Pencil size={14} />
                Editar
              </button>
              <button
                onClick={() => setToDelete(row)}
                className="inline-flex items-center gap-1 rounded-md px-2 py-1 text-xs font-medium text-red-600 hover:bg-red-50"
                title="Eliminar"
              >
                <Trash2 size={14} />
                Eliminar
              </button>
            </div>
          )}
        />

        {/* Modal Form */}
        <Modal
          open={openForm}
          onClose={() => setOpenForm(false)}
          title={editing ? "Editar AFP" : "Nueva AFP"}
        >
          <AfpForm
            isEditing={!!editing}
            defaultValues={
              editing || {
                nombre: "",
                codigo_suseso: "",
                tasa_comision: "",
                vigente: true,
              }
            }
            loading={creating || updating}
            onCancel={() => setOpenForm(false)}
            onSubmit={(payload) => {
              if (editing) onUpdate(editing.id, payload);
              else onCreate(payload);
            }}
          />
        </Modal>

        {/* Confirmación */}
        <Confirm
          open={!!toDelete}
          description={toDelete ? `¿Eliminar la AFP "${toDelete.nombre}"?` : ""}
          confirmText={deleting ? "Eliminando..." : "Eliminar"}
          onCancel={() => setToDelete(null)}
          onConfirm={() => toDelete && onDelete(toDelete.id)}
        />
      </div>
    </Layout>
  );
}
