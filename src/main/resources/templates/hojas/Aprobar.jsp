<%-- 
    Document   : Aprobar
    Created on : 9 oct 2025, 1:08:22 p.m.
    Author     : HP-NUEVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Documentos por Aprobar - Gestión Documental</title>
    <link rel="stylesheet" href="../css/apro.css">
</head>
<body>

<!-- Header -->
<header class="header">
    <div class="header-left">
        <button class="menu-btn" onclick="window.location.href='../Administrador.jsp'">←</button>
        <h1>Documentos por Aprobar</h1>
    </div>
    <div class="header-right">
        <div class="user-info">
            <div class="avatar">JP</div>
            <span>Juan Pérez</span>
        </div>
    </div>
</header>

<div class="container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <nav>
            <a href="../Administrador.jsp">Dashboard</a>
            <a href="MisDocumentos.jsp">Mis Documentos</a>
            <a href="Enviados.jsp">Enviados</a>
            <a href="Papelera.jsp">Papelera</a>
            <a href="Aprobar.jsp" class="active">Por Aprobar</a>
            <a href="CrearAdmioUser.jsp">Crear Usuario o Administrador</a>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="content">
        <section class="upload-section">
            <div class="upload-header">
                <h2>Documentos Pendientes de Aprobación</h2>
                <button class="btn-primary" onclick="alert('Filtrar documentos por tipo')">🔍 Filtrar</button>
            </div>

            <p class="note">Estos son los documentos que requieren tu revisión y aprobación antes de ser publicados o compartidos.</p>

            <div class="doc-grid">
                <!-- Ejemplo 1 -->
                <div class="doc-card">
                    <div class="doc-type">PDF</div>
                    <h3>Informe de Ventas Q1 2024</h3>
                    <p class="meta">Enviado por: <strong>maria.garcia@empresa.com</strong></p>
                    <p class="meta">Fecha de envío: 2024-03-10</p>
                    <div class="tags">
                        <span>Finanzas</span>
                        <span>Reporte</span>
                    </div>
                    <div class="actions">
                        <button class="btn-primary" onclick="aprobarDocumento('Informe de Ventas Q1 2024')">Aprobar</button>
                        <button class="btn-secondary" onclick="rechazarDocumento('Informe de Ventas Q1 2024')">Rechazar</button>
                    </div>
                </div>

                <!-- Ejemplo 2 -->
                <div class="doc-card">
                    <div class="doc-type">DOC</div>
                    <h3>Procedimiento de Seguridad</h3>
                    <p class="meta">Enviado por: <strong>seguridad@empresa.com</strong></p>
                    <p class="meta">Fecha de envío: 2024-03-05</p>
                    <div class="tags">
                        <span>Operaciones</span>
                        <span>Política</span>
                    </div>
                    <div class="actions">
                        <button class="btn-primary" onclick="aprobarDocumento('Procedimiento de Seguridad')">Aprobar</button>
                        <button class="btn-secondary" onclick="rechazarDocumento('Procedimiento de Seguridad')">Rechazar</button>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

<script>
function aprobarDocumento(nombre) {
    alert("Has aprobado el documento: " + nombre);
    // Aquí podrías hacer una llamada a tu servlet para actualizar el estado a 'aprobado'
}

function rechazarDocumento(nombre) {
    const motivo = prompt("Indica el motivo del rechazo para '" + nombre + "':");
    if (motivo) {
        alert("Documento rechazado.\nMotivo: " + motivo);
        // Aquí luego se puede enlazar con el backend para registrar el rechazo
    }
}
</script>

</body>
</html>

