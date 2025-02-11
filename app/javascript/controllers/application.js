import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
document.addEventListener("DOMContentLoaded", () => {
  const sidebarToggleButton = document.querySelector("[data-sidebar-toggle]");
  const sidebar = document.querySelector(".sidebar");

  sidebarToggleButton.addEventListener("click", () => {
    sidebar.classList.toggle("translate-x-full"); // Toggle visibility
  });
});
