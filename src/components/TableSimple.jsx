// src/components/TableSimple.jsx
export default function TableSimple({
  columns,
  rows,
  loading,
  onEdit,
  onDelete,
  renderActions,        // 👈 nuevo
  rowKey,               // 👈 nuevo (función opcional)
}) {
  // Normaliza rows por si llega {data:[]}
  const safeRows =
    Array.isArray(rows) ? rows
    : Array.isArray(rows?.data) ? rows.data
    : [];

  return (
    <div className="overflow-hidden rounded-xl border border-gray-200 bg-white">
      <table className="min-w-full text-sm">
        <thead className="bg-gray-50 text-gray-700">
          <tr>
            {columns.map((c) => (
              <th key={c.key} className="px-3 py-2 text-left font-semibold" style={{ width: c.width }}>
                {c.header}
              </th>
            ))}
            <th className="px-3 py-2 text-right font-semibold">Acciones</th>
          </tr>
        </thead>
        <tbody>
          {loading ? (
            <tr>
              <td colSpan={columns.length + 1} className="px-3 py-6 text-center text-gray-500">Cargando…</td>
            </tr>
          ) : safeRows.length === 0 ? (
            <tr>
              <td colSpan={columns.length + 1} className="px-3 py-6 text-center text-gray-500">Sin registros</td>
            </tr>
          ) : (
            safeRows.map((r) => (
              <tr key={rowKey ? rowKey(r) : (r.afp_id ?? r.id)} className="border-t">
                {columns.map((c) => (
                  <td key={c.key} className="px-3 py-2">
                    {c.render ? c.render(r[c.key], r) : r[c.key]}
                  </td>
                ))}
                <td className="px-3 py-2 text-right">
                  {renderActions ? (
                    renderActions(r)
                  ) : (
                    <>
                      <button onClick={() => onEdit?.(r)} className="text-brand-700 hover:underline mr-3">Editar</button>
                      <button onClick={() => onDelete?.(r)} className="text-red-600 hover:underline">Eliminar</button>
                    </>
                  )}
                </td>
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div>
  );
}
