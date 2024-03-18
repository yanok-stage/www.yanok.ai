/** @type {import('tailwindcss').Config} */
// tailwind.config.js
module.exports = {
  mode: 'jit',
  content: [
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.html',
    './integrations/**/*.html',
  ],
  theme: {
    fontFamily: {
      'jost': ['Jost', 'sans-serif'],
    },
    extend: {
      spacing: {
        'site-gutter': {
          default: '5em',
        },
        'container': '80rem',
      },
      backgroundColor: {
        black: 'rgb(30, 30, 30)',
        brand: {
          default: "rgb(0, 85, 212)",
        },
      },
      colors: {
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
