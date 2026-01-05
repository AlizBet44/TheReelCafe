<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuario - The Reel Café</title>
    
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/framework.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/social-core.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/recursos/icons/et.png" sizes="32x32">
</head>
<body>
    <header class="d-flex justify-content-around align-items-center bg-header-footer padding-header-admin">
        <div class="d-flex align-items-center">
            <img class="logo-img-header" src="${pageContext.request.contextPath}/recursos/imgs/logo.png" alt="Logo The Reel Cafe">
            <h1 class="text_header">The Reel <br> Café</h1>
        </div>

        <div class="d-flex gap">
            <ul class="d-flex list-none-style gap">
                <li><img class="user-icon rounded" src="${pageContext.request.contextPath}/recursos/icons/user-default.png" alt="User Icon"></li>
                <li><button class="btn-usuario">USUARIO</button></li>
                <li><a href="${pageContext.request.contextPath}/index.html" class="btn-cerrar-sesion">CERRAR SESION</a></li>
            </ul>
        </div>
    </header>

    <!-- Admin Section -->
    <section class="admin-section">
        <div class="admin-header">
            <h2 class="admin-title">Gestión de usuarios</h2>
            <p class="admin-subtitle">Gestiona perfiles, modifica permisos, revisa actividad y mantiene el control operativo de los usuarios registrados.</p>
        </div>
        
        <div class="">
            <div class="admin-content" style="display: flex; justify-content: center; align-items: center;">
                <div class="admin-edit-form" style="display: flex; justify-items: center;">
                    <form class="user-edit-form" 
                          action="${pageContext.request.contextPath}/GestionarCuentasController?action=guardar" 
                          method="post" 
                          style="max-width: 500px; width: 100%;">
                        
                        <!-- Campo oculto para el ID -->
                        <input type="hidden" name="idUsuario" value="${cuenta.id}">
                        
                        <div class="form-group">
                            <label class="form-label">Username:</label>
                            <input type="text" class="form-input" 
                                   placeholder="Ingresa el username" 
                                   value="${cuenta.nombre}" 
                                   readonly>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Correo:</label>
                            <input type="email" class="form-input" 
                                   placeholder="Ingresa el correo" 
                                   value="${cuenta.correo}" 
                                   readonly>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Rol:</label>
                            <select class="form-select" name="idRol">
                                <c:choose>
                                    <c:when test="${esAdmin}">
                                        <option value="2">Usuario</option>
                                        <option value="1" selected>Admin</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="2" selected>Usuario</option>
                                        <option value="1">Admin</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                        </div>
                        
                        <div class="form-buttons">
                            <button type="submit" class="btn-admin btn-save">Guardar</button>
                            <a href="${pageContext.request.contextPath}/GestionarCuentasController?action=listar" 
                               class="btn-admin btn-cancel">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer" class="d-flex justify-content-between bg-header-footer">
        <div class="d-flex align-items-center margin">
            <img class="logo-img-footer" src="${pageContext.request.contextPath}/recursos/imgs/logo.png" alt="Logo The Reel Cafe">
            <h2 class="text-footer-logo">The Reel <br> Café</h2>
        </div>

        <div>
            <p class="text-footer">2025B -Aplicaciones Web - Grupo 2</p>
        </div>
    </footer>
</body>
</html>