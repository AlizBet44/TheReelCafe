<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <title>Gestión de Usuarios - The Reel Café</title>

            <!-- CSS -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css" />
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css" />

            <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/recursos/icons/et.png"
                sizes="32x32">

            <style>
                /* Modal Overlay */
                .modal-overlay {
                    display: none;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0, 0, 0, 0.6);
                    z-index: 1000;
                    justify-content: center;
                    align-items: center;
                }

                .modal-overlay.active {
                    display: flex;
                    animation: fadeIn 0.3s ease;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                    }

                    to {
                        opacity: 1;
                    }
                }

                @keyframes slideIn {
                    from {
                        transform: translateY(-50px);
                        opacity: 0;
                    }

                    to {
                        transform: translateY(0);
                        opacity: 1;
                    }
                }

                .modal-box {
                    background: #FFFFFF;
                    border-radius: 20px;
                    padding: 40px 50px;
                    max-width: 500px;
                    width: 90%;
                    text-align: center;
                    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                    animation: slideIn 0.3s ease;
                }

                .modal-icon {
                    width: 80px;
                    height: 80px;
                    margin: 0 auto 20px;
                    background: #FFF3E0;
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .modal-icon.danger {
                    background: #FFEBEE;
                }

                .modal-icon svg {
                    width: 40px;
                    height: 40px;
                }

                .modal-title {
                    font-family: var(--fuente-familia, 'Arial', sans-serif);
                    font-size: 28px;
                    font-weight: bold;
                    color: #333;
                    margin-bottom: 15px;
                }

                .modal-message {
                    font-family: var(--fuente-familia, 'Arial', sans-serif);
                    font-size: 18px;
                    color: #666;
                    margin-bottom: 30px;
                    line-height: 1.5;
                }

                .modal-buttons {
                    display: flex;
                    gap: 20px;
                    justify-content: center;
                }

                .modal-btn {
                    padding: 15px 40px;
                    font-family: var(--fuente-familia, 'Arial', sans-serif);
                    font-size: 18px;
                    font-weight: bold;
                    border: none;
                    border-radius: 12px;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    min-width: 150px;
                }

                .modal-btn-confirm {
                    background: #D4A84B;
                    color: white;
                }

                .modal-btn-confirm:hover {
                    background: #C49A3F;
                    transform: translateY(-2px);
                }

                .modal-btn-danger {
                    background: #6B4423;
                    color: white;
                }

                .modal-btn-danger:hover {
                    background: #5A3A1E;
                    transform: translateY(-2px);
                }

                .modal-btn-cancel {
                    background: #6B4423;
                    color: white;
                }

                .modal-btn-cancel:hover {
                    background: #5A3A1E;
                    transform: translateY(-2px);
                }
            </style>

            <script>
                let actionUrl = '';

                function mostrarModalEliminar(idUsuario, contextPath) {
                    actionUrl = contextPath + '/GestionarCuentasController?action=eliminar&idUsuario=' + idUsuario;
                    document.getElementById('modalEliminar').classList.add('active');
                }

                function cerrarModalEliminar() {
                    document.getElementById('modalEliminar').classList.remove('active');
                    actionUrl = '';
                }

                function confirmarEliminacion() {
                    if (actionUrl) {
                        window.location.href = actionUrl;
                    }
                }

                function mostrarModalDesactivar(idUsuario, contextPath) {
                    actionUrl = contextPath + '/GestionarCuentasController?action=desactivar&idUsuario=' + idUsuario;
                    document.getElementById('modalDesactivar').classList.add('active');
                }

                function cerrarModalDesactivar() {
                    document.getElementById('modalDesactivar').classList.remove('active');
                    actionUrl = '';
                }

                function confirmarDesactivacion() {
                    if (actionUrl) {
                        window.location.href = actionUrl;
                    }
                }

                document.addEventListener('DOMContentLoaded', function () {
                    document.getElementById('modalEliminar').addEventListener('click', function (e) {
                        if (e.target === this) cerrarModalEliminar();
                    });
                    document.getElementById('modalDesactivar').addEventListener('click', function (e) {
                        if (e.target === this) cerrarModalDesactivar();
                    });
                });
            </script>
        </head>

        <body>

            <header class="d-flex justify-content-around align-items-center bg-header-footer">
                <div class="d-flex align-items-center">
                    <img class="logo-img-header" src="${pageContext.request.contextPath}/recursos/imgs/logo.png">
                    <h1 class="text_header">The Reel <br> Café</h1>
                </div>

                <ul class="d-flex list-none-style gap">
                    <li>
                        <img class="user-icon rounded"
                            src="${pageContext.request.contextPath}/recursos/icons/user-default.png">
                    </li>
                    <li><button class="btn-usuario">USUARIO</button></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/index.jsp" class="btn-cerrar-sesion">CERRAR
                            SESIÓN</a>
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

                            <c:if test="${empty lista}">
                                <p>No hay registros disponibles.</p>
                            </c:if>

                            <c:forEach var="fila" items="${lista}">
                                <div class="table-row">

                                    <span>${fila.nombre}</span>
                                    <span>${fila.correo}</span>
                                    <span>${fila.rol}</span>

                                    <div class="table-actions">

                                        <a href="${pageContext.request.contextPath}/GestionarCuentasController?action=cambiar&idUsuario=${fila.id}"
                                            class="btn-action">
                                            <img src="${pageContext.request.contextPath}/recursos/icons/cambiar.png"
                                                alt="Editar">
                                        </a>

                                        <button class="btn-action"
                                            onclick="mostrarModalEliminar(${fila.id}, '${pageContext.request.contextPath}')">
                                            <img src="${pageContext.request.contextPath}/recursos/icons/tachito.png"
                                                alt="Eliminar">
                                        </button>

                                        <c:choose>
                                            <c:when test="${fila.rol == 'Administrador'}">
                                                <span class="btn-admin btn-activate">N/A</span>
                                            </c:when>
                                            <c:when test="${fila.estadoTexto == 'Activo'}">
                                                <button class="btn-admin btn-activate"
                                                    onclick="mostrarModalDesactivar(${fila.id}, '${pageContext.request.contextPath}')">
                                                    Activo
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/GestionarCuentasController?action=activar&idUsuario=${fila.id}"
                                                    class="btn-admin btn-activate">
                                                    Inactivo
                                                </a>
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

            <!-- MODAL ELIMINAR -->
            <div id="modalEliminar" class="modal-overlay">
                <div class="modal-box">
                    <div class="modal-icon danger">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="#6B4423">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                        </svg>
                    </div>
                    <h2 class="modal-title">¿Eliminar esta cuenta?</h2>
                    <p class="modal-message">Esta acción no se puede deshacer. La cuenta será eliminada permanentemente.
                    </p>
                    <div class="modal-buttons">
                        <button class="modal-btn modal-btn-confirm" onclick="confirmarEliminacion()">
                            Sí, eliminar
                        </button>
                        <button class="modal-btn modal-btn-cancel" onclick="cerrarModalEliminar()">
                            Cancelar
                        </button>
                    </div>
                </div>
            </div>

            <!-- MODAL DESACTIVAR -->
            <div id="modalDesactivar" class="modal-overlay">
                <div class="modal-box">
                    <div class="modal-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="#D4A84B">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                        </svg>
                    </div>
                    <h2 class="modal-title">¿Desactivar esta cuenta?</h2>
                    <p class="modal-message">El usuario no podrá acceder mientras esté desactivada. Podrás reactivarla
                        después.</p>
                    <div class="modal-buttons">
                        <button class="modal-btn modal-btn-confirm" onclick="confirmarDesactivacion()">
                            Sí, desactivar
                        </button>
                        <button class="modal-btn modal-btn-cancel" onclick="cerrarModalDesactivar()">
                            Cancelar
                        </button>
                    </div>
                </div>
            </div>

            <footer class="d-flex justify-content-between bg-header-footer">
                <div class="d-flex align-items-center margin">
                    <img class="logo-img-footer" src="${pageContext.request.contextPath}/recursos/imgs/logo.png">
                    <h2 class="text-footer-logo">The Reel <br> Café</h2>
                </div>

                <p class="text-footer">2025B - Aplicaciones Web - Grupo 2</p>
            </footer>

        </body>

        </html>