<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resultados de Búsqueda - The Reel Café</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-movie.css" />

    <style>
        .search-results-container {
            margin: 30px 0;
        }

        .search-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #d4af37;
        }

        .search-info {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .search-info h2 {
            margin: 0;
            font-size: 24px;
            color: #333;
        }

        .search-criteria {
            font-size: 14px;
            color: #666;
        }

        .results-count {
            background-color: #d4af37;
            color: #333;
            padding: 8px 15px;
            border-radius: 5px;
            font-weight: bold;
            font-size: 14px;
        }

        .search-form-inline {
            background-color: #f5f5f5;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 30px;
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .search-form-inline input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .search-form-inline button {
            padding: 10px 20px;
            background-color: #d4af37;
            color: #333;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .search-form-inline button:hover {
            background-color: #b8941f;
        }

        .movie-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            display: flex;
            gap: 15px;
            padding: 15px;
            margin-bottom: 15px;
            transition: box-shadow 0.3s;
        }

        .movie-card:hover {
            box-shadow: 0 4px 12px rgba(212, 175, 55, 0.3);
        }

        .movie-card-poster {
            flex-shrink: 0;
            width: 120px;
            height: 180px;
            background-color: #e0e0e0;
            border-radius: 5px;
            overflow: hidden;
        }

        .movie-card-poster img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .movie-card-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .movie-card-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin: 0 0 8px 0;
        }

        .movie-card-details {
            font-size: 13px;
            color: #666;
            margin-bottom: 8px;
        }

        .movie-card-details span {
            margin-right: 15px;
        }

        .movie-card-synopsis {
            font-size: 13px;
            color: #555;
            line-height: 1.4;
            margin-bottom: 10px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .movie-card-actions {
            display: flex;
            gap: 10px;
            margin-top: auto;
        }

        .btn-view {
            padding: 8px 15px;
            background-color: #d4af37;
            color: #333;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 12px;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-view:hover {
            background-color: #b8941f;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #d4af37;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .no-poster {
            display: flex;
            align-items: center;
            justify-content: center;
            color: #999;
            font-size: 12px;
        }
    </style>
</head>

<body>

<header class="d-flex justify-content-between align-items-center bg-header-footer padding-header-admin">
    <div class="d-flex align-items-center">
        <a href="${pageContext.request.contextPath}/index.jsp" style="text-decoration: none; display: flex; align-items: center; gap: 10px;">
            <img class="logo-img-header"
                 src="${pageContext.request.contextPath}/recursos/imgs/logo.png">
            <h1 class="text_header">The Reel <br> Café</h1>
        </a>
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

<!-- RESULTADOS DE BÚSQUEDA -->
<section>
    <div class="admin-header-section">
        <h1 class="text-h2-admin-edit">Resultados de Búsqueda</h1>
        <p class="text-parrafo-section-admin">
            Se encontraron <strong>${cantidadResultados}</strong> película(s) que coinciden con tu búsqueda.
        </p>
    </div>

    <div class="admin-content">
        <div class="search-results-container">

            <!-- ENCABEZADO DE RESULTADOS -->
            <div class="search-header">
                <div class="search-info">
                    <h2>Películas encontradas</h2>
                    <div class="search-criteria">Criterio: <strong>"${criterio}"</strong></div>
                </div>
                <div class="results-count">${cantidadResultados} resultado(s)</div>
            </div>

            <!-- FORMULARIO DE NUEVA BÚSQUEDA -->
            <form action="${pageContext.request.contextPath}/BuscarPeliculasController" method="post" class="search-form-inline">
                <input type="hidden" name="action" value="buscar">
                <input type="text" name="criterio" placeholder="Buscar otra película..." required>
                <button type="submit">Buscar</button>
            </form>

            <!-- LISTA DE PELÍCULAS ENCONTRADAS -->
            <c:forEach var="pelicula" items="${peliculas}">
                <div class="movie-card">
                    
                    <!-- POSTER -->
                    <div class="movie-card-poster">
                        <c:choose>
                            <c:when test="${not empty pelicula.poster}">
                                <img src="${pelicula.poster}" alt="Poster de ${pelicula.titulo}">
                            </c:when>
                            <c:otherwise>
                                <div class="no-poster">Sin imagen</div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- CONTENIDO -->
                    <div class="movie-card-content">
                        <div>
                            <h3 class="movie-card-title">${pelicula.titulo}</h3>
                            
                            <!-- DETALLES -->
                            <div class="movie-card-details">
                                <c:if test="${not empty pelicula.director}">
                                    <span>Director: ${pelicula.director}</span>
                                </c:if>
                                <c:if test="${not empty pelicula.duracion}">
                                    <span>Duración: ${pelicula.duracion} min</span>
                                </c:if>
                            </div>

                            <!-- SINOPSIS -->
                            <c:if test="${not empty pelicula.sinopsis}">
                                <p class="movie-card-synopsis">${pelicula.sinopsis}</p>
                            </c:if>
                        </div>

                        <!-- ACCIONES -->
                        <div class="movie-card-actions">
                            <c:if test="${not empty pelicula.trailer}">
                                <a href="${pelicula.trailer}" target="_blank" class="btn-view">Ver Tráiler</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/visualizarPeliculaController?action=ampliarPelicula&idPelicula=${pelicula.id}" class="btn-view">Ver Detalle</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

        <!-- ENLACE PARA VOLVER -->
        <a href="${pageContext.request.contextPath}/index.jsp" class="back-link">← Volver al catálogo</a>

    </div>
</section>

<footer class="bg-header-footer padding-footer">
    <p>&copy; 2024 The Reel Café. Todos los derechos reservados.</p>
</footer>

</body>
</html>
