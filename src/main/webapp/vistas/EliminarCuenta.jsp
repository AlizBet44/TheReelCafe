<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Cuenta - The Reel Café</title>
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

    <section class="admin-section">
        <div class="admin-header">
            <h2 class="admin-title">Confirmar Eliminación</h2>
            <p class="admin-subtitle">Esta acción no se puede deshacer.</p>
        </div>

        <div class="admin-content" style="display: flex; justify-content: center; align-items: center; min-height: 300px;">
            <div style="text-align: center; max-width: 500px;">
                <h3 style="margin-bottom: 20px; color: #e74c3c;">
                    ¿Estás seguro que deseas eliminar esta cuenta?
                </h3>
                <p style="margin-bottom: 30px; color: #7f8c8d;">
                    Esta acción eliminará permanentemente la cuenta del sistema.
                </p>

                <div class="form-buttons">
                    <a href="${pageContext.request.contextPath}/GestionarCuentasController?action=confirmar&decision=true&accion=eliminar&idUsuario=${idUsuario}" 
                       class="btn-admin btn-save" 
                       style="background-color: #e74c3c;">
                        Sí, Eliminar
                    </a>
                    <a href="${pageContext.request.contextPath}/GestionarCuentasController?action=listar" 
                       class="btn-admin btn-cancel">
                        Cancelar
                    </a>
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