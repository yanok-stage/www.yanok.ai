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
        'container': '48rem',
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