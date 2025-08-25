import { Link } from "react-router-dom";

export default function Breadcrumb({ items }) {
  return (
    <nav className="text-sm text-gray-500 mb-4" aria-label="Breadcrumb">
      <ol className="flex items-center gap-2">
        {items.map((it, idx) => (
          <li key={idx} className="flex items-center gap-2">
            {it.to ? (
              <Link
                to={it.to}
                className="text-brand-600 hover:text-brand-800 font-medium"
              >
                {it.label}
              </Link>
            ) : (
              <span className="text-gray-700">{it.label}</span>
            )}
            {idx < items.length - 1 && (
              <span className="text-gray-400">/</span>
            )}
          </li>
        ))}
      </ol>
    </nav>
  );
}
