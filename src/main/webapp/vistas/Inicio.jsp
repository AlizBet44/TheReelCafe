<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Reel Cafe</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css">

    <!-- ICONOS -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/recursos/icons/et.png" sizes="32x32">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/icons/et.png">
</head>

<body>

    <!-- HEADER: SOLO BÚSQUEDA DE PELÍCULA -->
    <header class="d-flex justify-content-around align-items-center bg-header-footer">

        <div class="d-flex align-items-center">
            <img class="logo-img-header"
                 src="${pageContext.request.contextPath}/recursos/imgs/logo.png"
                 alt="Logo The Reel Cafe">
            <h1 class="text_header">The Reel <br> Café</h1>
        </div>

        <!-- FORMULARIO DE BÚSQUEDA -->
        <form class="d-flex gap search-form-container"
              action="${pageContext.request.contextPath}/BuscarPelicula"
              method="GET">

            <div class="buscador">
                <input
                    class="buscador-input"
                    type="text"
                    name="busqueda"
                    placeholder="Buscar película..."
                    required>
            </div>

            <button type="submit" class="btn-buscar">
                Buscar
            </button>
        </form>

    </header>

    <!-- PORTADA -->
    <section>
        <div class="hero-section">
            <img src="${pageContext.request.contextPath}/recursos/imgs/Banner2.png"
                 class="banner-img"
                 alt="Banner The Reel Cafe">
            <h2 class="titulo_logeado">
                Bienvenido a <br>
                The Reel Café
            </h2>
        </div>
    </section>

    <!-- CONTENIDO BÁSICO -->
    <section class="social-section">
        <div class="d-flex justify-content-center">
            <p class="text-parrafo">
                Utiliza el buscador para encontrar información sobre películas.
            </p>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="d-flex justify-content-between bg-header-footer">
        <div class="d-flex align-items-center margin">
            <img class="logo-img-footer"
                 src="${pageContext.request.contextPath}/recursos/imgs/logo.png"
                 alt="Logo The Reel Cafe">
            <h2 class="text-footer-logo">The Reel <br> Café</h2>
        </div>

        <div>
            <p class="text-footer">2025B - Aplicaciones Web - Grupo 2</p>
        </div>
    </footer>

</body>
</html>
