<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #001f3f 40%, #003366 100%);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .avatar {
            width: 180px;
            height: 120px;
            margin: 0 auto 28px;
            border-radius: 10%;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(50, 50, 50, 0.08);
        }

        .avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .register-container {
            width: 420px;
            background: rgba(0, 0, 40, 0.9);
            border-radius: 12px;
            padding: 35px;
            box-shadow: 0 0 25px rgba(0, 150, 255, 0.3);
            text-align: center;
            border: 1px solid rgba(0,150,255,0.3);
        }

        .register-container h1 {
            margin-bottom: 10px;
            font-size: 24px;
            font-weight: bold;
            color: #00bfff;
        }

        .register-container p {
            font-size: 14px;
            color: #bbb;
            margin-bottom: 25px;
        }

        .register-container img {
            width: 70px;
            margin-bottom: 10px;
            filter: drop-shadow(0 0 5px rgba(255,255,255,0.5));
        }

        .input-field {
            width: 85%;
            padding: 12px;
            margin: 10px auto;
            display: block;
            border: none;
            border-radius: 6px;
            background: #f0f0f0;
            font-size: 14px;
            text-align: center;
        }

        .btn {
            width: 85%;
            padding: 12px;
            margin: 12px auto;
            display: block;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-register {
            background: linear-gradient(90deg, #004488, #0077cc);
            color: #fff;
            box-shadow: 0 0 10px rgba(0,150,255,0.4);
        }

        .btn-register:hover {
            background: linear-gradient(90deg, #0055aa, #0099ff);
        }

        .btn-back {
            background: #ccad00;
            color: #000;
        }

        .btn-back:hover {
            background: #FFD700;
        }

        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #ccc;
        }

        .register-container::before {
            content: "";
            position: absolute;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle at 50% 50%, rgba(0,150,255,0.15), transparent 70%);
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: -1;
        }
    </style>
</head>
<body>

    <div class="register-container">
        <div class="avatar">
            <img src="../img/perfil.png" alt="perfil">
        </div>
        <h1>Crear Nuevo Usuario</h1>
        <p>Rellene todas las casillas para poder crear su usuario.</p>
        <form>
            <input type="text" class="input-field" placeholder="Nombre" required>
            <input type="text" class="input-field" placeholder="Apellido" required>
            <input type="email" class="input-field" placeholder="Correo electrónico" required>
            <input type="password" class="input-field" placeholder="Contraseña" required>
            <input type="password" class="input-field" placeholder="Confirmar contraseña" required>
            <div class="">
                <button type="submit" class="btn btn-register" onclick="window.location.href='../Login.jsp'">Registrarme</button>
                <button type="button" class="btn btn-back" onclick="window.location.href='../Login.jsp'">Volver al Inicio de Sesión</button>
            </div>
        </form>

        <div class="footer">
            © 2025 Sistema de Gestión Documental
        </div>
    </div>

</body>
</html>
