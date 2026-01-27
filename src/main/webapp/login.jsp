<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - The Reel Cafe</title>
    <meta name="description" content="Inicia sesión en The Reel Cafe para acceder a tu cuenta y disfrutar de nuestro catálogo de películas.">
    <link rel="stylesheet" href="css/framework.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="icon" type="image/png" href="recursos/icons/et.png" sizes="32x32">
    <link rel="icon" type="image/png" href="recursos/icons/et.png" sizes="192x192">
    <link rel="shortcut icon" href="recursos/icons/et.png">
</head>
<body>
    <header class="d-flex justify-content-between align-items-center bg-header-footer">
        <div class="d-flex align-items-center padding-login">
            <img class="logo-img-header" src="recursos/imgs/logo.png" alt="Logo The Reel Cafe">
            <h1 class="text_header">The Reel <br> Café</h1>
        </div>
    </header>

    <section class="d-flex justify-content-center align-items-center global-container">
        <article class="margin-login-right container-text">
            <h1 class="text-h1">Iniciar sesión</h1>
            <br>
            <p class="text-parrafo tamaño">Accede a tu cuenta para disfrutar reseñas personalizadas, conectar con otros cinéfilos y gestionar tu perfil.</p>
            <br>
            <div>
                <img class="imagen-login" src="recursos/imgs/Toy-story1.png" alt="Personajes de Toy Story">
            </div>
        </article>

        <article class="container-text separacion-login">
            <form class="d-flex flex-colum gap form-login" action="LoginController" method="POST">
                
                <!-- Mostrar mensaje de error si existe -->
                <% if (request.getAttribute("error") != null) { %>
                    <div class="error-message">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>
                
                <!-- Mostrar mensaje de éxito si existe -->
                <% if (request.getAttribute("mensaje") != null) { %>
                    <div class="success-message">
                        <%= request.getAttribute("mensaje") %>
                    </div>
                <% } %>
                
                <label for="login-email">Correo</label>
                <input type="email" id="login-email" name="email" placeholder="Escribe tu correo" required>
                
                <label for="login-password">Contraseña</label>
                <input type="password" id="login-password" name="password" placeholder="Escribe tu contraseña" required>
                
                <button type="submit" class="btn-iniciar-sesion-login">Iniciar sesión</button>
                
                <p class="parrafo">¿No tienes cuenta?</p>
                <a class="link" href="registro.jsp">Crea una aquí</a>
            </form>
        </article>
    </section>

    <footer id="footer" class="d-flex justify-content-between bg-header-footer">
        <div class="d-flex align-items-center margin">
            <img class="logo-img-footer" src="recursos/imgs/logo.png" alt="Logo The Reel Cafe">
            <h2 class="text-footer-logo">The Reel <br> Café</h2>
        </div>
        <div>
            <p class="text-footer">2025B - Aplicaciones Web - Grupo 2</p>
        </div>
    </footer>
</body>
</html>
