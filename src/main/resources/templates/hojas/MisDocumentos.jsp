<%-- 
    Document   : MisDocumentos
    Created on : 9 oct 2025, 1:07:10 p.m.
    Author     : HP-NUEVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mis Documentos - Gestión Documental</title>
    <link rel="stylesheet" href="../css/misdocs.css">
</head>
<body>

<header class="header">
    <div class="header-left">
        <button class="menu-btn" onclick="window.location.href='../Administrador.jsp'">←</button>
        <h1>Mis Documentos</h1>
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
            <a href="MisDocumentos.jsp" class="active">Mis Documentos</a>
            <a href="Enviados.jsp">Enviados</a>
            <a href="Papelera.jsp">Papelera</a>
            <a href="Aprobar.jsp">Por Aprobar</a>
            <a href="CrearAdmioUser.jsp">Crear Usuario o Administrador </a>
            
        </nav>

       
    </aside>

    <main class="content">
        <section class="upload-section">
            <h2>Documentos Trabajados</h2>
            <p class="note">Aquí se muestran todos tus documentos creados, editados o subidos al sistema.</p>

            <div class="search-bar">
                <input type="text" placeholder="Buscar documento..." class="search-input">
                <button class="btn-primary">Buscar</button>
            </div>

            <div class="doc-grid">
                <!-- Documento 1 -->
                <div class="doc-card">
                    <div class="doc-type">DOCX</div>
                    <h3>Informe de Proyecto.docx</h3>
                    <p class="meta">Modificado: 2025-09-30 | 3 MB</p>
                    <div class="actions">
                        <button class="btn-primary">Abrir</button>
                        <button class="btn-secondary">Eliminar</button>
                    </div>
                </div>

                <!-- Documento 2 -->
                <div class="doc-card">
                    <div class="doc-type">PDF</div>
                    <h3>Reporte Financiero.pdf</h3>
                    <p class="meta">Modificado: 2025-09-15 | 2 MB</p>
                    <div class="actions">
                        <button class="btn-primary">Abrir</button>
                        <button class="btn-secondary">Eliminar</button>
                    </div>
                </div>

                <!-- Documento 3 -->
                <div class="doc-card">
                    <div class="doc-type">XLSX</div>
                    <h3>Presupuesto 2025.xlsx</h3>
                    <p class="meta">Modificado: 2025-09-10 | 1,5 MB</p>
                    <div class="actions">
                        <button class="btn-primary">Abrir</button>
                        <button class="btn-secondary">Eliminar</button>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

<script>
    // Más adelante podrás conectar esto con tu base de datos
    function eliminarDocumento(nombre) {
        if (confirm("¿Deseas eliminar el documento '" + nombre + "'?")) {
            alert("Documento eliminado correctamente.");
        }
    }
</script>

</body>
</html>

