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
        function confirmarEliminar(idUsuario) {
            if (confirm('¿Estás seguro que deseas eliminar esta cuenta?\n\nEsta acción no se puede deshacer.')) {
                window.location.href = '${pageContext.request.contextPath}/GestionarCuentasController?action=confirmar&decision=true&accion=eliminar&idUsuario=' + idUsuario;
            }
        }
        
        function confirmarDesactivar(idUsuario) {
            if (confirm('¿Estás seguro de desactivar esta cuenta?\n\nEl usuario no podrá iniciar sesión hasta que reactives su cuenta.')) {
                window.location.href = '${pageContext.request.contextPath}/GestionarCuentasController?action=confirmar&decision=true&accion=desactivar&idUsuario=' + idUsuario;
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

                            <!-- Botón Cambiar Rol -->
                            <a href="${pageContext.request.contextPath}/GestionarCuentasController?action=cambiar&idUsuario=${fila.id}"
                               class="btn-action"
                               title="Cambiar Rol">
                                <img src="${pageContext.request.contextPath}/recursos/icons/cambiar.png"
                                     alt="Cambiar Rol">
                            </a>

                            <!-- Botón Eliminar con confirmación -->
                            <button class="btn-action"
                                    onclick="confirmarEliminar(${fila.id})"
                                    title="Eliminar Cuenta"
                                    style="border: none; background: none; cursor: pointer;">
                                <img src="${pageContext.request.contextPath}/recursos/icons/tachito.png"
                                     alt="Eliminar">
                            </button>

                            <!-- Botón Activar/Desactivar - Solo para Usuarios -->
                            <c:choose>
                                <c:when test="${fila.rol == 'Usuario'}">
                                    <c:choose>
                                        <c:when test="${fila.estadoTexto == 'Activo'}">
                                            <button onclick="confirmarDesactivar(${fila.id})"
                                                    class="btn-admin btn-activate"
                                                    style="background-color: #f39c12; border: none; cursor: pointer;"
                                                    title="Desactivar Cuenta">
                                                Desactivar
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/GestionarCuentasController?action=activar&idUsuario=${fila.id}"
                                               class="btn-admin btn-activate"
                                               style="background-color: #27ae60;"
                                               title="Activar Cuenta">
                                                Activar
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <span class="btn-admin" style="background-color: #95a5a6; cursor: not-allowed;">N/A</span>
                                </c:otherwise>
                            </c:choose>

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