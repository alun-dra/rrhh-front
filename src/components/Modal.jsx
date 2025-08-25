export default function Modal({ open, onClose, title, children }) {
  return (
    <div className={`fixed inset-0 z-50 ${open ? "" : "hidden"}`}>
      <div className="absolute inset-0 bg-black/40" onClick={onClose} />
      <div className="absolute inset-0 flex items-center justify-center p-4">
        <div className="w-full max-w-lg rounded-xl bg-white border border-gray-200 shadow-xl">
          <div className="px-4 py-3 border-b">
            <h3 className="text-sm font-semibold text-gray-900">{title}</h3>
          </div>
          <div className="p-4">{children}</div>
        </div>
      </div>
    </div>
  );
}
