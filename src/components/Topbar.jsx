export default function Topbar({ onMenu }) {
  return (
    <header className="h-16 bg-white border-b border-gray-200 flex items-center px-4 gap-3 sticky top-0 z-30">
      <button
        onClick={onMenu}
        className="lg:hidden inline-flex items-center justify-center w-10 h-10 rounded-lg border border-gray-200 bg-white hover:bg-gray-50"
        aria-label="Abrir menú"
      >
        ☰
      </button>
      <h1 className="text-sm font-medium text-gray-700">
        Sistema de RR.HH. • Bworksoft
      </h1>
    </header>
  );
}
