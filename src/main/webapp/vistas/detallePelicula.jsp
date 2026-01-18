<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Detalle de Película - The Reel Café</title>

            <!-- CSS -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-movie.css">

            <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/recursos/icons/et.png"
                sizes="32x32">
            <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/recursos/icons/et.png"
                sizes="192x192">
            <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/icons/et.png">

            <style>
                .detail-container {
                    display: flex;
                    gap: 40px;
                    padding: 40px;
                    max-width: 1200px;
                    margin: 0 auto;
                }

                .detail-left {
                    flex-shrink: 0;
                    width: 300px;
                }

                .poster-display {
                    width: 100%;
                    height: 450px;
                    border-radius: 15px;
                    overflow: hidden;
                    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
                    background-color: #e0e0e0;
                }

                .poster-display img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .no-poster-placeholder {
                    width: 100%;
                    height: 100%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    background: linear-gradient(135deg, #d4af37 0%, #6B4423 100%);
                    color: white;
                    font-size: 18px;
                    text-align: center;
                    padding: 20px;
                }

                .detail-right {
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                    gap: 20px;
                }

                .movie-title {
                    font-size: 36px;
                    font-weight: bold;
                    color: #333;
                    margin: 0 0 10px 0;
                    border-bottom: 3px solid #d4af37;
                    padding-bottom: 15px;
                }

                .info-group {
                    background-color: #f5f5f5;
                    border-radius: 10px;
                    padding: 15px 20px;
                    border-left: 4px solid #d4af37;
                }

                .info-label {
                    font-size: 12px;
                    color: #888;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    margin-bottom: 5px;
                }

                .info-value {
                    font-size: 16px;
                    color: #333;
                    font-weight: 500;
                }

                .info-row {
                    display: flex;
                    gap: 20px;
                }

                .info-row .info-group {
                    flex: 1;
                }

                .sinopsis-text {
                    font-size: 15px;
                    line-height: 1.7;
                    color: #555;
                }

                .action-buttons {
                    display: flex;
                    gap: 15px;
                    margin-top: 20px;
                }

                .btn-trailer {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    padding: 15px 30px;
                    background: linear-gradient(135deg, #d4af37 0%, #c49a3f 100%);
                    color: #333;
                    text-decoration: none;
                    border-radius: 10px;
                    font-weight: bold;
                    font-size: 16px;
                    transition: all 0.3s ease;
                    box-shadow: 0 4px 12px rgba(212, 175, 55, 0.3);
                }

                .btn-trailer:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 6px 16px rgba(212, 175, 55, 0.4);
                }

                .btn-back-catalog {
                    display: inline-flex;
                    align-items: center;
                    gap: 8px;
                    padding: 15px 30px;
                    background: #6B4423;
                    color: white;
                    text-decoration: none;
                    border-radius: 10px;
                    font-weight: bold;
                    font-size: 16px;
                    transition: all 0.3s ease;
                }

                .btn-back-catalog:hover {
                    background: #5A3A1E;
                    transform: translateY(-2px);
                }

                .error-container {
                    text-align: center;
                    padding: 60px 40px;
                    max-width: 600px;
                    margin: 40px auto;
                    background: #fff;
                    border-radius: 15px;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                }

                .error-icon {
                    font-size: 60px;
                    margin-bottom: 20px;
                }

                .error-title {
                    font-size: 28px;
                    color: #333;
                    margin-bottom: 15px;
                }

                .error-message {
                    font-size: 16px;
                    color: #666;
                    margin-bottom: 25px;
                }
            </style>
        </head>

        <body>
            <header class="d-flex justify-content-between align-items-center bg-header-footer padding-header-admin">
                <div class="d-flex align-items-center">
                    <a href="${pageContext.request.contextPath}/BuscarPeliculasController?action=buscar&criterio="
                        style="text-decoration: none; display: flex; align-items: center; gap: 10px;">
                        <img class="logo-img-header" src="${pageContext.request.contextPath}/recursos/imgs/logo.png"
                            alt="Logo The Reel Cafe">
                        <h1 class="text_header">The Reel <br> Café</h1>
                    </a>
                </div>

                <div class="d-flex gap">
                    <UL class="d-flex list-none-style gap">
                        <LI>
                            <a href="${pageContext.request.contextPath}/index.html">
                                <img class="user-icon rounded-md"
                                    src="${pageContext.request.contextPath}/recursos/icons/user-default.png"
                                    alt="User Icon">
                            </a>
                        </LI>
                        <LI><button class="btn-usuario">USUARIO</button></LI>
                        <LI><a href="${pageContext.request.contextPath}/index.jsp" class="btn-cerrar-sesion">CERRAR
                                SESIÓN</a></LI>
                    </UL>
                </div>
            </header>

            <section>
                <c:choose>
                    <c:when test="${not empty pelicula}">
                        <!-- Encabezado de la sección -->
                        <div class="admin-header-section">
                            <h1 class="text-h2-admin-new">Detalle de película</h1>
                            <p class="text-parrafo-section-admin">Información completa de la película seleccionada.</p>
                        </div>

                        <!-- Contenido del detalle -->
                        <div class="detail-container">
                            <!-- Columna izquierda - Poster -->
                            <div class="detail-left">
                                <div class="poster-display">
                                    <c:choose>
                                        <c:when test="${not empty pelicula.poster}">
                                            <img src="${pelicula.poster}" alt="Poster de ${pelicula.titulo}">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="no-poster-placeholder">
                                                <span>Imagen no disponible</span>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <!-- Columna derecha - Información -->
                            <div class="detail-right">
                                <h1 class="movie-title">${pelicula.titulo}</h1>

                                <div class="info-row">
                                    <c:if test="${not empty pelicula.director}">
                                        <div class="info-group">
                                            <div class="info-label">Director</div>
                                            <div class="info-value">${pelicula.director}</div>
                                        </div>
                                    </c:if>

                                    <c:if test="${pelicula.duracion > 0}">
                                        <div class="info-group">
                                            <div class="info-label">Duración</div>
                                            <div class="info-value">${pelicula.duracion} minutos</div>
                                        </div>
                                    </c:if>
                                </div>

                                <c:if test="${not empty pelicula.fechaEstreno}">
                                    <div class="info-group">
                                        <div class="info-label">Fecha de Estreno</div>
                                        <div class="info-value">${pelicula.fechaEstreno}</div>
                                    </div>
                                </c:if>

                                <c:if test="${not empty pelicula.sinopsis}">
                                    <div class="info-group">
                                        <div class="info-label">Sinopsis</div>
                                        <p class="sinopsis-text">${pelicula.sinopsis}</p>
                                    </div>
                                </c:if>

                                <!-- Botones de acción -->
                                <div class="action-buttons">
                                    <c:if test="${not empty pelicula.trailer}">
                                        <a href="${pelicula.trailer}" target="_blank" class="btn-trailer">
                                            ▶ Ver Tráiler
                                        </a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/BuscarPeliculasController?action=buscar&criterio="
                                        class="btn-back-catalog">
                                        ← Volver al Catálogo
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Mensaje de error si no hay película -->
                        <div class="error-container">
                            <div class="error-icon">🎬</div>
                            <h2 class="error-title">Película no disponible</h2>
                            <p class="error-message">${mensajeError}</p>
                            <a href="${pageContext.request.contextPath}/BuscarPeliculasController?action=buscar&criterio="
                                class="btn-back-catalog">
                                ← Volver al Catálogo
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </section>

            <footer id="footer" class="d-flex justify-content-between bg-header-footer">
                <div class="d-flex align-items-center margin">
                    <img class="logo-img-footer" src="${pageContext.request.contextPath}/recursos/imgs/logo.png"
                        alt="Logo The Reel Cafe">
                    <h2 class="text-footer-logo">The Reel <br> Café</h2>
                </div>

                <div>
                    <p class="text-footer">2025B - Aplicaciones Web - Grupo 2</p>
                </div>
            </footer>

        </body>

        </html>