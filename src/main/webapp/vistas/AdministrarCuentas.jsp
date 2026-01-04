<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Usuarios - The Reel Café</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css" />

    <link rel="icon" type="image/png"
          href="${pageContext.request.contextPath}/recursos/icons/et.png"
          sizes="32x32">

    <script>
        function confirmarEliminar(url) {
            if (confirm('¿Eliminar este registro?')) {
                window.location.href = url;
            }
        }
    </script>
</head>

<body>

<header class="d-flex justify-content-around align-items-center bg-header-footer">
    <div class="d-flex align-items-center">
        <img class="logo-img-header"
             src="${pageContext.request.contextPath}/recursos/imgs/logo.png">
        <h1 class="text_header">The Reel <br> Café</h1>
    </div>

    <ul class="d-flex list-none-style gap">
        <li>
            <img class="user-icon rounded"
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
<section class="admin-section">

    <div class="admin-header">
        <h2 class="admin-title">Gestión de usuarios</h2>
        <p class="admin-subtitle">
            Gestiona perfiles y mantén el control operativo de los registros.
        </p>
    </div>

    <div class="admin-content">
        <div class="users-table">

            <div class="table-header">
                <span>Nombre</span>
                <span>Correo</span>
                <span>Rol</span>
                <span>Acciones</span>
            </div>

            <div class="table-body">

                <!-- EL CONTROLADOR DECIDE QUÉ MANDAR -->
                <c:if test="${empty lista}">
                    <p>No hay registros disponibles.</p>
                </c:if>

                <c:forEach var="fila" items="${lista}">
                    <div class="table-row">

                        <!-- el controlador define las claves -->
                        <span>${fila.nombre}</span>
                        <span>${fila.correo}</span>
                        <span>${fila.rol}</span>

                        <div class="table-actions">

                            <a href="${pageContext.request.contextPath}/${editarUrl}?id=${fila.id}"
                               class="btn-action">
                                <img src="${pageContext.request.contextPath}/recursos/icons/cambiar.png"
                                     alt="Editar">
                            </a>

                            <button class="btn-action"
                                    onclick="confirmarEliminar('${pageContext.request.contextPath}/${eliminarUrl}?id=${fila.id}')">
                                <img src="${pageContext.request.contextPath}/recursos/icons/tachito.png"
                                     alt="Eliminar">
                            </button>

                            <a href="${pageContext.request.contextPath}/${toggleUrl}?id=${fila.id}"
                               class="btn-admin btn-activate">
                                ${fila.estadoTexto}
                            </a>

                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

        <div class="admin-actions">
            <button class="btn-admin btn-back"
                    onclick="window.location.href='${pageContext.request.contextPath}/index.html'">
                Volver
            </button>
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