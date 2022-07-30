document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll('[data-behavior=auto-resize]').forEach((target) => {
    target.style.height = target.scrollHeight + 'px';
    target.addEventListener('input', (event) => {
    	event.target.style.height = 'auto';
      event.target.style.height = event.target.scrollHeight + 'px';
    });
  });
});
