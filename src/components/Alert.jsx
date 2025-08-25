// src/components/Alert.jsx
export default function Alert({ children, variant = "error", className = "" }) {
  const styles = {
    error:
      "rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700",
    success:
      "rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700",
    info:
      "rounded-xl border border-blue-200 bg-blue-50 px-4 py-3 text-sm text-blue-700",
    warn:
      "rounded-xl border border-yellow-200 bg-yellow-50 px-4 py-3 text-sm text-yellow-800",
  };
  return (
    <div role="alert" className={`${styles[variant]} ${className}`}>
      {children}
    </div>
  );
}
