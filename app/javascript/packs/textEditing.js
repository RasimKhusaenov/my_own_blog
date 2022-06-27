document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll('[data-behavior=auto-resize]').forEach((target) => {
    target.addEventListener('input', (event) => {
      event.target.style.height = event.target.scrollHeight + 'px';
    });
  });
});
