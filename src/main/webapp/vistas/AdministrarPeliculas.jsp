<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Administrar Películas</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-movie.css" />

    <script>
        function confirmarEliminar(url) {
            if (confirm('¿Eliminar esta película?')) {
                window.location.href = url;
            }
        }
    </script>
</head>

<body>

<header class="d-flex justify-content-between align-items-center bg-header-footer padding-header-admin">
    <div class="d-flex align-items-center">
        <img class="logo-img-header"
             src="${pageContext.request.contextPath}/recursos/imgs/logo.png">
        <h1 class="text_header">The Reel <br> Café</h1>
    </div>

    <ul class="d-flex list-none-style gap">
        <li>
            <img class="user-icon rounded-md"
                 src="${pageContext.request.contextPath}/recursos/icons/user-default.png">
        </li>
        <li><button class="btn-usuario">USUARIO</button></li>
        <li>
            <a href="${pageContext.request.contextPath}/index.jsp"
               class="btn-cerrar-sesion">CERRAR SESIÓN</a>
        </li>
    </ul>
</header>

<!-- ADMIN -->
<section>
    <div class="admin-header-section">
        <h1 class="text-h2-admin-edit">Gestión de películas</h1>
        <p class="text-parrafo-section-admin">
            Administra el catálogo, registra nuevas películas y actualiza la información existente.
        </p>
    </div>

    <div class="admin-content">
        <div class="movies-table-container">

            <div class="table-header">
                <span>Poster</span>
                <span>Título</span>
                <span>Duración</span>
            </div>

            <div class="table-body">

                <!-- SI NO HAY PELÍCULAS -->
                <c:if test="${empty peliculas}">
                    <p>No hay películas registradas.</p>
                </c:if>

                <!-- LISTA DE PELÍCULAS -->
                <c:forEach var="p" items="${peliculas}">
                    <div class="table-row row-beige">

                        <!-- POSTER -->
                        <c:choose>
                            <c:when test="${not empty p.poster}">
                                <img src="${p.poster}"
                                     class="movie-poster-small"
                                     alt="Poster de ${p.titulo}">
                            </c:when>
                            <c:otherwise>
                                <span>-</span>
                            </c:otherwise>
                        </c:choose>

                        <!-- TITULO -->
                        <span class="movie-title-cell">${p.titulo}</span>

                        <!-- DURACIÓN -->
                        <span class="movie-duration">${p.duracion} min</span>

                        <!-- ACCIONES -->
                        <div class="d-flex gap">

                            <a href="${pageContext.request.contextPath}/GestionarPeliculas?action=editar&idPelicula=${p.id}"
                               class="btn-admin btn-edit">Editar</a>

                            <a href="#"
                               class="btn-admin btn-back"
                               onclick="confirmarEliminar('${pageContext.request.contextPath}/GestionarPeliculas?action=eliminar&idPelicula=${p.id}');return false;">
                               Eliminar
                            </a>
                        </div>

                    </div>
                </c:forEach>

            </div>
        </div>

        <div class="admin-buttons">
            <a href="${pageContext.request.contextPath}/GestionarPeliculas?action=publicar"
               class="btn-admin btn-new">Publicar nueva</a>

            <a href="${pageContext.request.contextPath}/index.html"
               class="btn-admin btn-back">Volver</a>
        </div>
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