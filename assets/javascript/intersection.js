let observer = new IntersectionObserver(function (entries) {
  entries.forEach(function (entry) {
    if (entry.target.dataset.intersectionTriggered) { return };

    if (entry.isIntersecting) {
      entry.target.classList.add(entry.target.dataset.intersectionOnce || '');
      entry.target.dataset.intersectionTriggered = true;
    }
  });
});

document.addEventListener('DOMContentLoaded', function () {
  let nodes = document.querySelectorAll('[data-intersection-once]');

  nodes.forEach(function (node) {
    observer.observe(node);
  });
});
