<%-- 
    Document   : Compartidos
    Created on : 9 oct 2025, 1:07:21 p.m.
    Author     : HP-NUEVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Documentos Enviados</title>
    <link rel="stylesheet" href="../css/enviados.css">
</head>
<body>

<!-- Header -->
<header class="header">
    <div class="header-left">
        <button class="menu-btn" onclick="window.location.href='../Administrador.jsp'">←</button>
        <h1>Documentos Enviados</h1>
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
            <a href="Enviados.jsp" class="active">Enviados</a>
            <a href="Papelera.jsp">Papelera</a>
            <a href="Aprobar.jsp">Por Aprobar</a>
            <a href="CrearAdmioUser.jsp">Crear Usuario o Administrador</a>
        </nav>
    </aside>

    <!-- Main Content -->
    <main class="content">
        <section class="upload-section">
            <div class="upload-header">
                <h2>Archivos Enviados</h2>
                <button class="btn-primary">+ Nuevo Envío</button>
            </div>

            <p class="note">Estos son los documentos que has compartido o enviado a otros usuarios.</p>

            <div class="doc-grid">
                <!-- Ejemplo de tarjeta -->
                <div class="doc-card">
                    <div class="doc-type">PDF</div>
                    <h3>Informe Anual 2024</h3>
                    <p class="meta">Enviado a: <strong>maria.garcia@empresa.com</strong></p>
                    <p class="meta">Fecha: 2024-02-10</p>
                    <div class="tags">
                        <span>Finanzas</span>
                        <span>Reporte</span>
                    </div>
                    <div class="actions">
                        <button class="btn-primary">Reenviar</button>
                        <button class="btn-secondary" onclick="confirmarEliminacion()">Eliminar Envío</button>
                    </div>
                </div>

                <div class="doc-card">
                    <div class="doc-type">DOC</div>
                    <h3>Propuesta Comercial</h3>
                    <p class="meta">Enviado a: <strong>ventas@cliente.com</strong></p>
                    <p class="meta">Fecha: 2024-01-28</p>
                    <div class="tags">
                        <span>Marketing</span>
                        <span>Clientes</span>
                    </div>
                    <div class="actions">
                        <button class="btn-primary">Reenviar</button>
                        <button class="btn-secondary" onclick="confirmarEliminacion()">Eliminar Envío</button>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

<script>
function confirmarEliminacion() {
    if (confirm("¿Deseas eliminar este envío? Esto no eliminará el documento original.")) {
        alert("Envío eliminado correctamente.");
        // Aquí luego se puede enlazar con un Servlet para procesar la eliminación
    }
}
</script>

</body>
</html>
