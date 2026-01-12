<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <title>Administrar Películas</title>

            <!-- CSS -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css" />
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css" />
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-movie.css" />
            <!--GG-->
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

                /* Modal Box */
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

                .modal-icon svg {
                    width: 40px;
                    height: 40px;
                    color: #D4A84B;
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
                    text-decoration: none;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    min-width: 150px;
                }

                .modal-btn-confirm {
                    background: #D4A84B;
                    color: white;
                }

                .modal-btn-confirm:hover {
                    background: #C49A3F;
                    transform: translateY(-2px);
                    box-shadow: 0 4px 12px rgba(212, 168, 75, 0.4);
                }

                .modal-btn-cancel {
                    background: #6B4423;
                    color: white;
                }

                .modal-btn-cancel:hover {
                    background: #5A3A1E;
                    transform: translateY(-2px);
                    box-shadow: 0 4px 12px rgba(107, 68, 35, 0.4);
                }
            </style>

            <script>
                let deleteUrl = '';

                function mostrarModalEliminar(idPelicula, contextPath) {
                    deleteUrl = contextPath + '/GestionarPeliculas?action=eliminar&idPelicula=' + idPelicula;
                    document.getElementById('modalEliminar').classList.add('active');
                }

                function cerrarModal() {
                    document.getElementById('modalEliminar').classList.remove('active');
                    deleteUrl = '';
                }

                function confirmarEliminacion() {
                    if (deleteUrl) {
                        window.location.href = deleteUrl;
                    }
                }

                // Cerrar modal al hacer clic fuera
                document.addEventListener('DOMContentLoaded', function () {
                    document.getElementById('modalEliminar').addEventListener('click', function (e) {
                        if (e.target === this) {
                            cerrarModal();
                        }
                    });
                });
            </script>
        </head>

        <body>

            <header class="d-flex justify-content-between align-items-center bg-header-footer padding-header-admin">
                <div class="d-flex align-items-center">
                    <img class="logo-img-header" src="${pageContext.request.contextPath}/recursos/imgs/logo.png">
                    <h1 class="text_header">The Reel <br> Café</h1>
                </div>

                <ul class="d-flex list-none-style gap">
                    <li>
                        <img class="user-icon rounded-md"
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
                                            <img src="${p.poster}" class="movie-poster-small"
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

                                        <a href="#" class="btn-admin btn-back"
                                            onclick="mostrarModalEliminar(${p.id}, '${pageContext.request.contextPath}'); return false;">
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

                        <a href="${pageContext.request.contextPath}/index.html" class="btn-admin btn-back">Volver</a>
                    </div>
                </div>
            </section>

            <!-- MODAL DE CONFIRMACIÓN DE ELIMINACIÓN -->
            <div id="modalEliminar" class="modal-overlay">
                <div class="modal-box">
                    <div class="modal-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                        </svg>
                    </div>
                    <h2 class="modal-title">¿Eliminar esta película?</h2>
                    <p class="modal-message">Esta acción no se puede deshacer. La película será eliminada
                        permanentemente del catálogo.</p>
                    <div class="modal-buttons">
                        <button class="modal-btn modal-btn-confirm" onclick="confirmarEliminacion()">
                            Sí, eliminar
                        </button>
                        <button class="modal-btn modal-btn-cancel" onclick="cerrarModal()">
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