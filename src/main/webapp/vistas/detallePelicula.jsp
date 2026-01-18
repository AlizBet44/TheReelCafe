<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle de Película - The Reel Café</title>
</head>

<body>

<header>
    <div>
        <a href="${pageContext.request.contextPath}/index.jsp">
            <img src="${pageContext.request.contextPath}/recursos/imgs/logo.png" alt="Logo">
            <h1>The Reel Café</h1>
        </a>
    </div>

    <ul>
        <li>
            <img src="${pageContext.request.contextPath}/recursos/icons/user-default.png" alt="Usuario">
        </li>
        <li><button>USUARIO</button></li>
        <li>
            <a href="${pageContext.request.contextPath}/index.jsp">CERRAR SESIÓN</a>
        </li>
    </ul>
</header>

<section>
    <c:choose>
        <c:when test="${not empty pelicula}">
            <!-- Detalle de la película -->
            <div>
                <h1>${pelicula.titulo}</h1>
                
                <div>
                    <!-- Poster -->
                    <div>
                        <c:choose>
                            <c:when test="${not empty pelicula.poster}">
                                <img src="${pelicula.poster}" alt="Poster de ${pelicula.titulo}">
                            </c:when>
                            <c:otherwise>
                                <div>Sin imagen disponible</div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Información de la película -->
                    <div>
                        <c:if test="${not empty pelicula.director}">
                            <p>
                                <strong>Director:</strong> ${pelicula.director}
                            </p>
                        </c:if>

                        <c:if test="${pelicula.duracion > 0}">
                            <p>
                                <strong>Duración:</strong> ${pelicula.duracion} minutos
                            </p>
                        </c:if>

                        <c:if test="${not empty pelicula.fechaEstreno}">
                            <p>
                                <strong>Fecha de Estreno:</strong> ${pelicula.fechaEstreno}
                            </p>
                        </c:if>

                        <c:if test="${not empty pelicula.sinopsis}">
                            <div>
                                <strong>Sinopsis:</strong>
                                <p>${pelicula.sinopsis}</p>
                            </div>
                        </c:if>

                        <!-- Acciones -->
                        <div>
                            <c:if test="${not empty pelicula.trailer}">
                                <a href="${pelicula.trailer}" target="_blank">Ver Tráiler</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/index.jsp">Volver al Catálogo</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Mensaje de error si no hay película -->
            <div>
                <h2>Película no disponible</h2>
                <p>${mensajeError}</p>
                <a href="${pageContext.request.contextPath}/index.jsp">Volver al Catálogo</a>
            </div>
        </c:otherwise>
    </c:choose>
</section>

<footer>
    <p>&copy; 2024 The Reel Café. Todos los derechos reservados.</p>
</footer>

</body>
</html>
