<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrar Películas</title>
<style>
    table { border-collapse: collapse; width: 100%; }
    th, td { border: 1px solid #ddd; padding: 8px; }
    th { background: #f4f4f4; }
    img.poster { max-width: 80px; height: auto; }
    .actions a { margin-right: 8px; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css" />
<script>
function confirmarEliminar(url) {
    if (confirm('¿Eliminar esta película?')) {
        window.location.href = url;
    }
}
</script>
</head>
<body>
<h1>Administrar Películas</h1>
<c:choose>
    <c:when test="${empty peliculas}">
        <p>No hay películas registradas.</p>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Poster</th>
                    <th>Director</th>
                    <th>Duración</th>
                    <th>Fecha Estreno</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${peliculas}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.titulo}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty p.poster}">
                                    <img class="poster" src="${p.poster}" alt="Poster de ${p.titulo}" />
                                </c:when>
                                <c:otherwise>
                                    -
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${p.director}</td>
                        <td>${p.duracion} min</td>
                        <td><fmt:formatDate value="${p.fechaEstreno}" pattern="yyyy-MM-dd"/></td>
                        <td class="actions">
                            <a href="${pageContext.request.contextPath}/GestionarPeliculas?action=publicar&id=${p.id}">Publicar</a>
                            <a href="${pageContext.request.contextPath}/GestionarPeliculas?action=llenar&id=${p.id}">Editar</a>
                            <a href="#" onclick="confirmarEliminar('${pageContext.request.contextPath}/GestionarPeliculas?action=eliminar&id=${p.id}');return false;">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>