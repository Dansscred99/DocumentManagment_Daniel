<%-- 
    Document   : CrearAdmioUser
    Created on : 9 oct 2025, 1:08:41 p.m.
    Author     : HP-NUEVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Usuario o Administrador</title>
    <link rel="stylesheet" href="../css/crear.css">
</head>
<body>

<header class="header">
    <div class="header-left">
        <button class="menu-btn" onclick="window.location.href='../Administrador.jsp'">←</button>
        <h1>Crear Usuario o Administrador</h1>
    </div>
    <div class="header-right">
        <div class="user-info">
            <div class="avatar">JP</div>
            <span>Juan Perez</span>
        </div>
    </div>
</header>

<div class="container">
    <aside class="sidebar">
        <nav>
            <a href="../Administrador.jsp">Dashboard</a>
            <a href="MisDocumentos.jsp">Mis Documentos</a>
            <a href="Enviados.jsp">Enviados</a>
            <a href="Papelera.jsp">Papelera</a>
            <a href="Aprobar.jsp">Por Aprobar</a>    
            <a href="CrearUsuario.jsp" class="active">Crear Usuario o Administrador</a>
        </nav>
    </aside>

    <main class="content">
        <section class="upload-section">
            <h2>Registro de Nuevo Usuario</h2>
            <p class="note">Completa los datos para agregar un nuevo usuario o administrador al sistema.</p>

            <form class="user-form" action="ControladorUsuario" method="post">
                <div class="form-group">
                    <label for="nombre">Nombre completo</label>
                    <input type="text" id="nombre" name="nombre" required placeholder="Ejemplo: Juan Pérez">
                </div>

                <div class="form-group">
                    <label for="correo">Correo electrónico</label>
                    <input type="email" id="correo" name="correo" required placeholder="usuario@correo.com">
                </div>

                <div class="form-group">
                    <label for="usuario">Nombre de usuario</label>
                    <input type="text" id="usuario" name="usuario" required placeholder="Nombre de usuario">
                </div>

                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" required placeholder="********">
                </div>

                <div class="form-group">
                    <label for="tipo">Tipo de cuenta</label>
                    <select id="tipo" name="tipo" required>
                        <option value="">Selecciona una opción</option>
                        <option value="usuario">Usuario</option>
                        <option value="administrador">Administrador</option>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-primary">Guardar Usuario</button>
                    <button type="reset" class="btn-secondary">Cancelar</button>
                </div>
            </form>
        </section>
    </main>
</div>

</body>
</html>
