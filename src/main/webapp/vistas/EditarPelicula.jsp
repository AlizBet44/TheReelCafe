<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Película - The Reel Cafe</title>

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-movie.css">

        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/recursos/icons/et.png" sizes="32x32">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/recursos/icons/et.png"
            sizes="192x192">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/icons/et.png">
    </head>

    <body>
        <header class="d-flex justify-content-between align-items-center bg-header-footer padding-header-admin">
            <div class="d-flex align-items-center">
                <img class="logo-img-header" src="${pageContext.request.contextPath}/recursos/imgs/logo.png"
                    alt="Logo The Reel Cafe">
                <h1 class="text_header">The Reel <br> Café</h1>
            </div>


            <div class="d-flex gap">
                <UL class="d-flex list-none-style gap">
                    <LI><img class="user-icon rounded-md"
                            src="${pageContext.request.contextPath}/recursos/icons/user-default.png" alt="User Icon">
                    </LI>
                    <LI><button class="btn-usuario">USUARIO</button></LI>
                    <LI><a href="${pageContext.request.contextPath}/index.jsp" class="btn-cerrar-sesion">CERRAR
                            SESION</a></LI>
                </UL>
            </div>
        </header>

        <!--Sección de edición de película-->
        <section class="">
            <div class="admin-header-section">
                <div>
                    <h1 class="text-h2-admin-new">Editar película</h1>
                </div>

                <p class="text-parrafo-section-admin">Modifica la información de la película seleccionada.</p>
            </div>

            <div class="form-edit-container">
                <form class="movie-form" action="${pageContext.request.contextPath}/GestionarPeliculas" method="post">
                    <!-- Columna izquierda - Upload de imagen -->
                    <div class="form-left">
                        <p class="upload-label">Poster</p>
                        <p class="upload-subtitle">Haz clic para cambiar el poster</p>
                        <div class="upload-area">
                            <!-- Si hay poster, mostrarlo como preview -->
                            <img src="${not empty pelicula.poster ? pelicula.poster : pageContext.request.contextPath.concat('/recursos/icons/Upload 2.png')}"
                                alt="Poster" class="${not empty pelicula.poster ? 'upload-preview' : 'upload-icon'}"
                                id="posterPreview">
                            <input type="text" name="poster" class="form-input" placeholder="URL del poster"
                                value="${pelicula.poster}"
                                style="position: absolute; bottom: 20px; width: calc(100% - 80px);"
                                onchange="document.getElementById('posterPreview').src = this.value || '${pageContext.request.contextPath}/recursos/icons/Upload 2.png';">
                        </div>
                    </div>

                    <!-- Columna derecha - Campos del formulario -->
                    <div class="form-right">
                        <div class="form-group form-full">
                            <label class="form-label">Título</label>
                            <input type="text" name="titulo" class="form-input"
                                placeholder="Ingresa el título de la película" value="${pelicula.titulo}" required>
                        </div>

                        <div class="form-group form-full">
                            <label class="form-label">Sinopsis</label>
                            <textarea name="sinopsis" class="form-textarea" rows="5"
                                placeholder="Ingresa la sinopsis de la película"
                                required>${pelicula.sinopsis}</textarea>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Director</label>
                                <input type="text" name="director" class="form-input"
                                    placeholder="Ingresa el nombre del director" value="${pelicula.director}" required>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Duración</label>
                                <input type="text" name="duracion" class="form-input" placeholder="Ingresa mins"
                                    value="${pelicula.duracion}" required>
                            </div>
                        </div>

                        <div class="form-group form-full">
                            <label class="form-label">Trailer URL</label>
                            <input type="url" name="urlTrailer" class="form-input"
                                placeholder="Ingresa la url del trailer" value="${pelicula.trailer}" required>
                        </div>

                        <!-- CAMPOS OCULTOS PARA EL CONTROLADOR -->
                        <input type="hidden" name="action" value="cambiar">
                        <input type="hidden" name="idPelicula" value="${pelicula.id}">

                        <div class="form-actions">
                            <button type="submit" class="btn-form btn-save">Guardar cambios</button>
                            <a href="${pageContext.request.contextPath}/GestionarPeliculas?action=listar"
                                class="btn-form btn-cancel">Cancelar</a>
                        </div>
                    </div>
                </form>
            </div>

        </section>


        <footer id="footer" class="d-flex justify-content-between bg-header-footer">
            <div class="d-flex align-items-center margin">
                <img class="logo-img-footer" src="${pageContext.request.contextPath}/recursos/imgs/logo.png"
                    alt="Logo The Reel Cafe">
                <h2 class="text-footer-logo">The Reel <br> Café</h2>
            </div>

            <div>
                <p class="text-footer">2025B -Aplicaciones Web - Grupo 2</p>
            </div>
        </footer>

    </body>

    </html>