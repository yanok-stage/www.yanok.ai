/** @type {import('tailwindcss').Config} */
// tailwind.config.js
module.exports = {
  mode: 'jit',
  content: [
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.html',
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
        black: 'rgb(8, 8, 8)',
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}