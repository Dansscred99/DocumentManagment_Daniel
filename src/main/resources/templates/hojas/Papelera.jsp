<%-- 
    Document   : Papelera
    Created on : 9 oct 2025, 1:08:13 p.m.
    Author     : HP-NUEVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Papelera - Gestión Documental</title>
    <link rel="stylesheet" href="../css/papelera.css">
</head>
<body>

<header class="header">
    <div class="header-left">
        <button class="menu-btn" onclick="window.location.href='../Administrador.jsp'">←</button>
        <h1>Papelera</h1>
    </div>
    <div class="header-right">
        <div class="user-info">
            <div class="avatar">JP</div>
            <span>Juan Pérez</span>
        </div>
    </div>
</header>

<div class="container">
    <aside class="sidebar">
        <nav>
            <a href="../Administrador.jsp">Dashboard</a>
            <a href="../hojas/MisDocumentos.jsp">Mis Documentos</a>
             <a href="../hojas/Enviados.jsp">Enviados</a>
             <a href="Papelera.jsp" class="active">Papelera</a>
            <a href="../hojas/Aprobar.jsp">Por Aprobar</a>
            <a href="CrearAdmioUser.jsp">Crear Usuario o Administrador</a>
           
        </nav>
    </aside>

    <main class="content">
        <section class="upload-section">
            <h2>Documentos en Papelera</h2>
            <p class="note">Aquí aparecerán los documentos que pueden ser eliminados permanentemente o restaurados.</p>

            <div class="doc-grid">
                <!-- Aquí podrás listar dinámicamente los archivos eliminados -->
                <div class="doc-card">
                    <div class="doc-type">PDF</div>
                    <h3>documento_eliminado.pdf</h3>
                    <p class="meta">Eliminado: 2024-01-25</p>
                    <div class="actions">
                        <button class="btn-primary">Restaurar</button>
                        <button class="btn-secondary" onclick="confirmarEliminacion()">Eliminar Definitivamente</button>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

<script>
function confirmarEliminacion() {
    if (confirm("¿Seguro que deseas eliminar este documento de forma permanente?")) {
        alert("Documento eliminado.");
        // Aquí más adelante podrás agregar la llamada a tu servlet o base de datos
    }
}
</script>

</body>
</html>
