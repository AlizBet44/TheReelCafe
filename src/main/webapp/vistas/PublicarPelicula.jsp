<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Reel Cafe</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_movie.css" />

    <!-- ICON -->
    <link rel="icon" type="image/png"
          href="${pageContext.request.contextPath}/recursos/icons/et.png"
          sizes="32x32">
    <link rel="icon" type="image/png"
          href="${pageContext.request.contextPath}/recursos/icons/et.png"
          sizes="192x192">
</head>

<body>

<header class="d-flex justify-content-between align-items-center bg-header-footer padding-header-admin">
    <div class="d-flex align-items-center">
        <img class="logo-img-header"
             src="${pageContext.request.contextPath}/recursos/imgs/logo.png"
             alt="Logo The Reel Cafe">
        <h1 class="text_header">The Reel <br> Café</h1>
    </div>

    <ul class="d-flex list-none-style gap">
        <li>
            <img class="user-icon rounded-md"
                 src="${pageContext.request.contextPath}/recursos/icons/user-default.png"
                 alt="User Icon">
        </li>
        <li><button class="btn-usuario">USUARIO</button></li>
        <li>
            <a href="${pageContext.request.contextPath}/index.jsp"
               class="btn-cerrar-sesion">CERRAR SESIÓN</a>
        </li>
    </ul>
</header>

<!-- ADMIN MOVIES -->
<section>

    <div class="d-flex gap-admin align-items-center admin-header-section">
        <div>
            <h1 class="text-h2-admin-new">Publicar película</h1>
        </div>
        <p class="text-parrafo-section-admin">
            Completa el formulario para agregar una nueva película al catálogo.
        </p>
    </div>

    <div class="form-edit-container">

        <!-- EL CONTROLADOR DEFINE action y method -->
        <form class="movie-form"
              action="${pageContext.request.contextPath}/GestionarPeliculas"
              method="post">

            <!-- COLUMNA IZQUIERDA -->
            <div class="form-left">
                <p class="upload-label">Poster</p>
                <p class="upload-subtitle">Haz clic para subir un nuevo poster</p>

                <div class="upload-area">
                    <img src="${pageContext.request.contextPath}/recursos/icons/Upload 2.png"
                         alt="Upload"
                         class="upload-icon">

                    <input type="text"
                           name="poster"
                           class="form-input"
                           placeholder="URL del poster">
                </div>
            </div>

            <!-- COLUMNA DERECHA -->
            <div class="form-right">

                <div class="form-group form-full">
                    <label class="form-label">Título</label>
                    <input type="text"
                           name="titulo"
                           class="form-input"
                           placeholder="Ingresa el título de la película"
                           required>
                </div>

                <div class="form-group form-full">
                    <label class="form-label">Sinopsis</label>
                    <textarea name="sinopsis"
                              class="form-textarea"
                              rows="5"
                              placeholder="Ingresa la sinopsis de la película"
                              required></textarea>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label">Director</label>
                        <input type="text"
                               name="director"
                               class="form-input"
                               placeholder="Ingresa el nombre del director"
                               required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Duración</label>
                        <input type="text"
                               name="duracion"
                               class="form-input"
                               placeholder="Ingresa mins"
                               required>
                    </div>
                </div>

                <div class="form-group form-full">
                    <label class="form-label">Trailer URL</label>
                    <input type="url"
                           name="urlTrailer"
                           class="form-input"
                           placeholder="Ingresa la url del trailer"
                           required>
                </div>

                <!-- EL CONTROLADOR IDENTIFICA LA ACCIÓN -->
                <input type="hidden" name="action" value="llenar">

                <div class="form-actions">
                    <button type="submit" class="btn-form btn-save">
                        Publicar
                    </button>

                    <a href="${pageContext.request.contextPath}/GestionarPeliculas?action=listar"
                       class="btn-form btn-cancel">
                        Cancelar
                    </a>
                </div>

            </div>
        </form>
    </div>

</section>

<footer class="d-flex justify-content-between bg-header-footer">
    <div class="d-flex align-items-center margin">
        <img class="logo-img-footer"
             src="${pageContext.request.contextPath}/recursos/imgs/logo.png">
        <h2 class="text-footer-logo">The Reel <br> Café</h2>
    </div>

    <p class="text-footer">2025B - Aplicaciones Web - Grupo 2</p>
</footer>

</body>
</html>
