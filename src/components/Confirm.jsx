export default function Confirm({ open, description, confirmText = "Confirmar", onCancel, onConfirm }) {
  return (
    <div className={`fixed inset-0 z-50 ${open ? "" : "hidden"}`}>
      <div className="absolute inset-0 bg-black/40" onClick={onCancel} />
      <div className="absolute inset-0 flex items-center justify-center p-4">
        <div className="w-full max-w-md rounded-xl bg-white border border-gray-200 shadow-xl p-4">
          <p className="text-sm text-gray-700">{description}</p>
          <div className="mt-4 flex justify-end gap-2">
            <button onClick={onCancel} className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm">Cancelar</button>
            <button onClick={onConfirm} className="rounded-lg bg-red-600 text-white px-3 py-2 text-sm hover:bg-red-500">{confirmText}</button>
          </div>
        </div>
      </div>
    </div>
  );
}
