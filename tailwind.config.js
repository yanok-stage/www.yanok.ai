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
        black: 'rgb(2, 16, 49)',
        brand: {
          default: "#0f659b",
        },
      },
      colors: {
        blue: "#0f659b",
        teal: "#0abab5",
        medBlue: 'rgb(4, 57, 91)',
        darkBlue: 'rgb(2, 16, 49)',
        darkerBlue: 'rgb(0, 5, 16)',
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
