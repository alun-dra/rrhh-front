import { NavLink } from "react-router-dom";
import Layout from "../components/Layout";
import {
  Building2,
  Settings,      
  Banknote,
  Landmark,
  Shield,        
  Heart,         
  Clock,
  Users,         
  Receipt,
  Layers,        
} from "lucide-react";

const cards = [
  { to: "/configuracion/empresa",            title: "Empresa",                 desc: "Datos de la empresa.",                     icon: Building2 },
  { to: "/configuracion/afp",                title: "AFP",                     desc: "Fondos de pensión y tasas.",              icon: Landmark },
  { to: "/configuracion/isapres",            title: "Isapres/Fonasa",          desc: "Instituciones de salud.",                 icon: Heart },
  { to: "/configuracion/mutuales",           title: "Mutuales",                desc: "Mutualidades de seguridad.",              icon: Shield },
  { to: "/configuracion/bancos",             title: "Bancos",                  desc: "Bancos disponibles.",                     icon: Landmark },
  { to: "/configuracion/parametros",         title: "Parámetros monetarios",   desc: "UF/UTM/Topes/Fechas.",                    icon: Banknote },
  { to: "/configuracion/tramos-impuesto",    title: "Tramo Impuesto Único",    desc: "Tabla SII con vigencia.",                 icon: Receipt },
  { to: "/configuracion/tasas-cotizacion",   title: "Tasas de cotización",     desc: "AFP/Salud/SIS/AFC/Mutual.",               icon: Layers },
  { to: "/configuracion/turnos",             title: "Turnos",                  desc: "Jornadas y asignaciones.",                icon: Clock },
  { to: "/configuracion/unidades",           title: "Unidades",                desc: "Estructura organizacional.",              icon: Settings },
  { to: "/configuracion/cargos",             title: "Cargos",                  desc: "Cargos y perfiles.",                      icon: Settings },
  { to: "/configuracion/centros-costo",      title: "Centros de costo",        desc: "Estructura financiera.",                  icon: Settings },
  { to: "/configuracion/usuarios",           title: "Usuarios y roles",        desc: "Cuentas y permisos.",                     icon: Users },
];

function Card({ to, title, desc, icon: Icon }) {
  const IconCmp = Icon || Settings;

  return (
    <NavLink
      to={to}
      className="group rounded-xl border border-gray-200 bg-white p-4 hover:border-brand-300 hover:shadow-md transition-colors"
    >
      <div className="flex items-start gap-3">
        <div className="rounded-lg p-2 bg-brand-50 text-brand-700">
          <IconCmp size={20} />
        </div>
        <div className="min-w-0">
          <h3 className="text-sm font-semibold text-gray-900">{title}</h3>
          <p className="mt-1 text-xs text-gray-500 line-clamp-2">{desc}</p>
        </div>
      </div>
      <div className="mt-4 text-xs font-medium text-brand-600 group-hover:text-brand-700">
        Configurar →
      </div>
    </NavLink>
  );
}

export default function Configuracion() {
  return (
    <Layout>
      <div className="max-w-6xl mx-auto space-y-6">
        <header>
          <h2 className="text-xl font-semibold text-gray-900 flex items-center gap-2">
            <Settings size={18} />
            Configuración
          </h2>
          <p className="text-sm text-gray-500">
            Ajustes generales del sistema de RR.HH.
          </p>
        </header>

        <section className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {cards.map((c) => (
            <Card key={c.to} {...c} />
          ))}
        </section>
      </div>
    </Layout>
  );
}
