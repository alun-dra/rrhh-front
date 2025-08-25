/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {
      colors: {
        brand: {
          950: "#10002B",
          900: "#240046",
          800: "#3C096C",
          700: "#5A189A",
          600: "#7B2CBF",
          500: "#9D4EDD",
          400: "#C77DFF",
          300: "#E0AAFF",
        },
      },
      boxShadow: {
        card: "0 10px 30px -10px rgba(16,0,43,0.45)",
      },
    },
  },
  plugins: [],
};
