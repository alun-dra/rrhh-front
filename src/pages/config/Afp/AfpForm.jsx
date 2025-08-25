import { useEffect, useMemo, useState } from "react";

const empty = {
  nombre: "",
  codigo_suseso: "",
  tasa_comision: "", // mostrado como porcentaje (ej: "1.10")
  vigente: true,
};

export default function AfpForm({
  isEditing = false,
  defaultValues = empty,
  loading = false,
  onSubmit,      // (payload) => void  -> payload.tasa_comision en DECIMAL (0.0110)
  onCancel,      // opcional
}) {
  const [values, setValues] = useState(empty);
  const [errors, setErrors] = useState({});

  // Normaliza valores iniciales (si viene decimal 0.011 => mostramos 1.10)
  useEffect(() => {
    const tasaPct =
      defaultValues?.tasa_comision !== undefined && defaultValues?.tasa_comision !== null
        ? (Number(defaultValues.tasa_comision) * 100).toFixed(2)
        : "";
    setValues({
      nombre: defaultValues?.nombre ?? "",
      codigo_suseso: defaultValues?.codigo_suseso ?? "",
      tasa_comision: tasaPct, // porcentaje para el input
      vigente: defaultValues?.vigente ?? true,
    });
    setErrors({});
  }, [defaultValues]);

  // Helpers
  const set = (name, val) => setValues((v) => ({ ...v, [name]: val }));

  const validate = () => {
    const e = {};
    if (!values.nombre.trim()) e.nombre = "Ingresa el nombre";
    if (!values.codigo_suseso.trim()) e.codigo_suseso = "Ingresa el código SUSESO";
    else if (!/^[A-Za-z0-9]{2,6}$/.test(values.codigo_suseso.trim())) {
      e.codigo_suseso = "Entre 2 y 6 caracteres alfanuméricos";
    }

    const n = Number(values.tasa_comision);
    if (Number.isNaN(n)) e.tasa_comision = "Ingresa un número";
    else if (n < 0 || n > 100) e.tasa_comision = "Debe estar entre 0 y 100";

    setErrors(e);
    return Object.keys(e).length === 0;
  };

  const submit = (ev) => {
    ev?.preventDefault?.();
    if (loading) return;
    if (!validate()) return;

    // Convertimos el porcentaje ingresado (ej 1.10) a DECIMAL (0.0110)
    const tasaDecimal = (Number(values.tasa_comision) / 100).toFixed(4);

    const payload = {
      nombre: values.nombre.trim(),
      codigo_suseso: values.codigo_suseso.trim().toUpperCase(),
      tasa_comision: tasaDecimal,
      vigente: !!values.vigente,
    };
    onSubmit?.(payload);
  };

  const canSave = useMemo(() => {
    if (loading) return false;
    if (!values.nombre || !values.codigo_suseso || values.tasa_comision === "") return false;
    return true;
  }, [values, loading]);

  return (
    <form onSubmit={submit} className="space-y-4">
      {/* Nombre */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Nombre</label>
        <input
          type="text"
          placeholder="AFP Ejemplo"
          className={`w-full rounded-lg border px-3 py-2 text-sm outline-none focus:ring-2
            ${errors.nombre ? "border-red-300 focus:ring-red-300" : "border-gray-300 focus:ring-brand-400"}`}
          value={values.nombre}
          onChange={(e) => set("nombre", e.target.value)}
          autoFocus
        />
        {errors.nombre && <p className="mt-1 text-xs text-red-600">{errors.nombre}</p>}
      </div>

      {/* Código SUSESO */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">
          Código SUSESO
        </label>
        <input
          type="text"
          placeholder="CAP, CUP, HAB..."
          maxLength={6}
          className={`w-full rounded-lg border px-3 py-2 text-sm uppercase tracking-wide outline-none focus:ring-2
            ${errors.codigo_suseso ? "border-red-300 focus:ring-red-300" : "border-gray-300 focus:ring-brand-400"}`}
          value={values.codigo_suseso}
          onChange={(e) => set("codigo_suseso", e.target.value.toUpperCase())}
        />
        {errors.codigo_suseso && (
          <p className="mt-1 text-xs text-red-600">{errors.codigo_suseso}</p>
        )}
      </div>

      {/* Comisión (%) */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Tasa (%)</label>
        <input
          type="number"
          step="0.01"
          min="0"
          max="100"
          placeholder="1.10"
          className={`w-full rounded-lg border px-3 py-2 text-sm outline-none focus:ring-2
            ${errors.tasa_comision ? "border-red-300 focus:ring-red-300" : "border-gray-300 focus:ring-brand-400"}`}
          value={values.tasa_comision}
          onChange={(e) => set("tasa_comision", e.target.value)}
        />
        <p className="mt-1 text-xs text-gray-500">Ejemplo: 1.10 equivale a 1,10 %.</p>
        {errors.tasa_comision && (
          <p className="mt-1 text-xs text-red-600">{errors.tasa_comision}</p>
        )}
      </div>

      {/* Vigente */}
      <label className="inline-flex items-center gap-2 select-none">
        <input
          type="checkbox"
          className="h-4 w-4 rounded border-gray-300 text-brand-600 focus:ring-brand-400"
          checked={!!values.vigente}
          onChange={(e) => set("vigente", e.target.checked)}
        />
        <span className="text-sm text-gray-700">Vigente</span>
      </label>

      {/* Acciones */}
      <div className="flex items-center justify-end gap-2 pt-2">
        {onCancel && (
          <button
            type="button"
            onClick={onCancel}
            className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50"
          >
            Cancelar
          </button>
        )}
        <button
          type="submit"
          disabled={!canSave}
          className="rounded-lg bg-brand-600 px-4 py-2 text-sm font-semibold text-white hover:bg-brand-500 disabled:opacity-60"
        >
          {loading ? (isEditing ? "Guardando..." : "Creando...") : (isEditing ? "Guardar" : "Crear")}
        </button>
      </div>
    </form>
  );
}
