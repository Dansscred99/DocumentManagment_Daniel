document.addEventListener("DOMContentLoaded", () => {

    const sidebar = document.getElementById("sidebar");
    const content = document.getElementById("content");
    const btnToggle = document.getElementById("btnToggleSidebar");
    const sapBody = document.getElementById("sap-body");

    // Toggle sidebar (si tienes esos elementos)
    if (btnToggle && sidebar && content) {
        btnToggle.addEventListener("click", () => {
            sidebar.classList.toggle("collapsed");
            content.classList.toggle("expanded");

            document.querySelectorAll(".sidebar-text").forEach(el => {
                el.style.display = sidebar.classList.contains("collapsed") ? "none" : "inline";
            });
        });
    }

    // Cargar módulos del sidebar por AJAX
    document.querySelectorAll("#sidebar .menu a[data-module]").forEach(link => {
        link.addEventListener("click", async e => {
            e.preventDefault();
            const moduleName = link.dataset.module;

            // Mark active link
            document.querySelectorAll("#sidebar .menu a").forEach(a => {
                a.classList.remove("active");
            });
            link.classList.add("active");

            // Load module
            try {
                const response = await fetch(`/sap/${moduleName}`);
                if (!response.ok) {
                    sapBody.innerHTML = `<h3 class='text-danger'>Error cargando módulo: ${moduleName}</h3>`;
                    return;
                }
                const html = await response.text();
                sapBody.innerHTML = html;
            } catch (err) {
                sapBody.innerHTML = `<h3 class='text-danger'>Error: ${err.message}</h3>`;
            }
        });
    });

});

// Recargar dashboard (volver al inicio)
function recargarDashboard() {
    const sapBody = document.getElementById("sap-body");
    
    // Reset active menu item
    document.querySelectorAll("#sidebar .menu a").forEach(a => {
        a.classList.remove("active");
    });

    // Mostrar contenido default del dashboard
    sapBody.innerHTML = `
        <div class="mb-4">
            <h2 class="fw-bold">
                Bienvenido al Sistema
            </h2>
            <p class="text-secondary mb-0">
                Selecciona una opción del menú para comenzar
            </p>
        </div>

        <div class="rounded shadow-sm p-4 mb-4" style="background-color: #1b263b;">
            <h3 class="text-white fw-bold mb-3">Acciones Rápidas</h3>
            <div class="row g-3">
                <div class="col-md-6">
                    <button class="btn btn-outline-primary w-100 py-3" onclick="cargarVista('/sap/documentos')">
                        <i class="bi bi-folder fs-5"></i><br>
                        <small>Ver mis documentos</small>
                    </button>
                </div>
                <div class="col-md-6">
                    <button class="btn btn-outline-primary w-100 py-3" onclick="cargarVista('/sap/enviar')">
                        <i class="bi bi-send fs-5"></i><br>
                        <small>Enviar documento</small>
                    </button>
                </div>
            </div>
        </div>
    `;
}

// Cargar cualquier vista dentro del dashboard
async function cargarVista(url) {
    const sapBody = document.getElementById("sap-body");

    try {
        const response = await fetch(url);
        if (!response.ok) {
            sapBody.innerHTML = "<h3 class='text-danger'>Error cargando vista</h3>";
            return;
        }

        const html = await response.text();
        sapBody.innerHTML = html;

        // preview de foto (solo si existe el input)
        const fotoInput = document.getElementById("fotoInput");
        if (fotoInput) {
            fotoInput.addEventListener("change", e => {
                const file = e.target.files[0];
                if (!file) return;

                const reader = new FileReader();
                reader.onload = r => {
                    const preview = document.getElementById("fotoPreview");
                    if (preview) preview.src = r.target.result;
                };
                reader.readAsDataURL(file);
            });
        }
    } catch (err) {
        sapBody.innerHTML = `<h3 class='text-danger'>Error: ${err.message}</h3>`;
    }
}

async function guardarPerfil() {

    const idUsuario = document.getElementById("idUsuario").value;
    const nombre = document.getElementById("nombre").value;
    const apellido = document.getElementById("apellido").value;
    const pass1 = document.getElementById("pass1").value;
    const pass2 = document.getElementById("pass2").value;
    const foto = document.getElementById("fotoInput").files[0];

    if (pass1 && pass1 !== pass2) {
        alert("Las contraseñas no coinciden");
        return;
    }

    let form = new FormData();
    form.append("idUsuario", idUsuario);
    form.append("nombre", nombre);
    form.append("apellido", apellido);

    if (pass1) {
        form.append("password", pass1);
    }

    if (foto) {
        form.append("foto", foto);
    }

    try {
        const response = await fetch("/perfil/actualizar", {
            method: "POST",
            body: form
        });

        const msg = await response.text();
        alert(msg);
    } catch (err) {
        alert("Error guardando perfil: " + err.message);
    }
}
