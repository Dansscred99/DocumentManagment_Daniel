document.addEventListener("DOMContentLoaded", () => {

    const sidebar = document.getElementById("sidebar");
    const content = document.getElementById("content");
    const btnToggle = document.getElementById("btnToggleSidebar");
    const sapBody = document.getElementById("sap-body");

    // Toggle sidebar
    btnToggle.addEventListener("click", () => {
        sidebar.classList.toggle("collapsed");
        content.classList.toggle("expanded");

        document.querySelectorAll(".sidebar-text").forEach(el => {
            el.style.display = sidebar.classList.contains("collapsed") ? "none" : "inline";
        });
    });

    // Cargar vistas del SAP por AJAX
    document.querySelectorAll("#sidebar .menu a[data-module]").forEach(link => {
        link.addEventListener("click", async e => {
            e.preventDefault();
            const moduleName = link.dataset.module;

            const response = await fetch(`/sap/${moduleName}`);
            const html = await response.text();

            sapBody.innerHTML = html;      // REEMPLAZA contenido
        });
    });

    

});

async function cargarVista(url) {

    const response = await fetch(url);
    if (!response.ok) {
        sapBody.innerHTML = "<h3 class='text-danger'>Error cargando vista</h3>";
        return;
    }

    const html = await response.text();
    sapBody.innerHTML = html;
}

