<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Sin Resultados - The Reel Café</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-movie.css" />

    <style>
        .no-results-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 400px;
            text-align: center;
            padding: 40px 20px;
        }

        .no-results-icon {
            font-size: 80px;
            margin-bottom: 20px;
            opacity: 0.6;
        }

        .no-results-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
        }

        .no-results-message {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
            max-width: 600px;
            line-height: 1.6;
        }

        .no-results-criteria {
            background-color: #f5f5f5;
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 30px;
            color: #555;
        }

        .search-suggestions {
            background-color: #fffbf0;
            padding: 20px;
            border-left: 4px solid #d4af37;
            border-radius: 5px;
            margin-bottom: 30px;
            text-align: left;
        }

        .search-suggestions h4 {
            color: #333;
            margin-top: 0;
            margin-bottom: 10px;
        }

        .search-suggestions ul {
            margin: 0;
            padding-left: 20px;
            color: #666;
        }

        .search-suggestions li {
            margin-bottom: 8px;
            font-size: 14px;
        }

        .search-form-retry {
            background-color: #f5f5f5;
            padding: 30px;
            border-radius: 8px;
            margin-bottom: 30px;
            max-width: 500px;
        }

        .search-form-retry h3 {
            margin-top: 0;
            color: #333;
            font-size: 18px;
            margin-bottom: 15px;
        }

        .search-form-retry form {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .search-form-retry input {
            flex: 1;
            min-width: 200px;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .search-form-retry button {
            padding: 12px 30px;
            background-color: #d4af37;
            color: #333;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .search-form-retry button:hover {
            background-color: #b8941f;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }

        .btn-secondary {
            padding: 12px 25px;
            background-color: #666;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
            display: inline-block;
        }

        .btn-secondary:hover {
            background-color: #444;
        }

        .btn-primary {
            padding: 12px 25px;
            background-color: #d4af37;
            color: #333;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
            display: inline-block;
        }

        .btn-primary:hover {
            background-color: #b8941f;
        }

        .error-message {
            background-color: #fff3cd;
            border: 1px solid #ffc107;
            color: #856404;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .error-icon {
            font-size: 24px;
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

<!-- SIN RESULTADOS -->
<section>
    <div class="admin-header-section">
        <h1 class="text-h2-admin-edit">Búsqueda Sin Resultados</h1>
        <p class="text-parrafo-section-admin">
            No encontramos lo que buscas, pero podemos ayudarte.
        </p>
    </div>

    <div class="admin-content">
        <div class="no-results-container">

            <!-- ICONO -->
            <div class="no-results-icon">🎬</div>

            <!-- MENSAJE PRINCIPAL -->
            <h2 class="no-results-title">No se encontraron películas</h2>

            <!-- MENSAJE DE ERROR SI EXISTE -->
            <c:if test="${not empty mensajeError}">
                <div class="error-message">
                    <span class="error-icon">⚠️</span>
                    <span>${mensajeError}</span>
                </div>
            </c:if>

            <!-- CRITERIO DE BÚSQUEDA -->
            <c:if test="${not empty criterio}">
                <div class="no-results-criteria">
                    No hay películas que coincidan con: <strong>"${criterio}"</strong>
                </div>
            </c:if>

            <!-- SUGERENCIAS -->
            <div class="search-suggestions">
                <h4>💡 Sugerencias:</h4>
                <ul>
                    <li>Verifica la ortografía del título o nombre del director</li>
                    <li>Intenta con palabras clave más generales</li>
                    <li>Busca por el año de estreno o género</li>
                    <li>Prueba con términos parciales (por ejemplo: "Guerra" en lugar de "Guerra de las Galaxias")</li>
                </ul>
            </div>

            <!-- FORMULARIO DE REINTENTO -->
            <div class="search-form-retry">
                <h3>🔍 Intenta nuevamente</h3>
                <form action="${pageContext.request.contextPath}/BuscarPeliculasController" method="post">
                    <input type="hidden" name="action" value="buscar">
                    <input type="text" name="criterio" placeholder="Escribe otro criterio de búsqueda..." required>
                    <button type="submit">Buscar</button>
                </form>
            </div>

            <!-- ACCIONES -->
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/index.jsp" class="btn-primary">
                    ← Ir al catálogo
                </a>
                <a href="${pageContext.request.contextPath}/index.jsp?top=true" class="btn-secondary">
                    Ver películas destacadas
                </a>
            </div>

        </div>
    </div>
</section>

<footer class="bg-header-footer padding-footer">
    <p>&copy; 2024 The Reel Café. Todos los derechos reservados.</p>
</footer>

</body>
</html>
