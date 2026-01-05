package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CuentaDAO;
import model.entitys.Cuenta;
import model.entitys.Usuario;
import model.entitys.Administrador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class GestionarCuentasController
 */
@WebServlet(name = "GestionarCuentasController", urlPatterns = {"/GestionarCuentasController", "/cuentas"})
public class GestionarCuentasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GestionarCuentasController() {
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null || action.isEmpty()) {
			action = "listar";
		}
		
		switch (action) {
		case "listar":
			listar(request, response);
			break;
		case "cambiar":
			cambiarRol(request, response);
			break;
		case "guardar":
			guardarRol(request, response);
			break;
		case "eliminar":
			eliminarCuenta(request, response);
			break;
		case "confirmar":
			confirmarAccion(request, response);
			break;
		case "desactivar":
			desactivarCuenta(request, response);
			break;
		case "activar":
			activarCuenta(request, response);
			break;
		default:
			listar(request, response);
			break;
		}
	}

	protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CuentaDAO dao = new CuentaDAO();
		List<Cuenta> listaCuentas = dao.obtenerTodas();
		
		// Convertir a formato que la JSP puede mostrar
		List<Map<String, Object>> lista = new ArrayList<>();
		for (Cuenta cuenta : listaCuentas) {
			Map<String, Object> fila = new HashMap<>();
			fila.put("id", cuenta.getId());
			fila.put("nombre", cuenta.getNombre());
			fila.put("correo", cuenta.getCorreo());
			
			// Determinar el rol según el tipo de clase
			if (cuenta instanceof Administrador) {
				fila.put("rol", "Administrador");
				fila.put("estadoTexto", "N/A");
			} else if (cuenta instanceof Usuario) {
				Usuario usuario = (Usuario) cuenta;
				fila.put("rol", "Usuario");
				Boolean estado = usuario.getEstado();
				fila.put("estadoTexto", (estado != null && estado) ? "Activo" : "Inactivo");
			} else {
				fila.put("rol", "Desconocido");
				fila.put("estadoTexto", "N/A");
			}
			
			lista.add(fila);
		}
		
		request.setAttribute("lista", lista);
		request.setAttribute("editarUrl", "GestionarCuentasController");
		request.setAttribute("eliminarUrl", "GestionarCuentasController");
		request.setAttribute("toggleUrl", "GestionarCuentasController");
		
		request.getRequestDispatcher("vistas/AdministrarCuentas.jsp").forward(request, response);
	}
	
	protected void cambiarRol(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		CuentaDAO dao = new CuentaDAO();
		Cuenta cuenta = dao.obtenerPorId(idUsuario);
		
		request.setAttribute("cuenta", cuenta);
		request.getRequestDispatcher("/vistas/CambiarRol.jsp").forward(request, response);
	}
	
	protected void guardarRol(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		Integer idRol = Integer.parseInt(request.getParameter("idRol"));
		
		CuentaDAO dao = new CuentaDAO();
		dao.actualizarRol(idUsuario, idRol);
		
		response.sendRedirect(request.getContextPath() + "/GestionarCuentasController?action=listar");
	}
	
	protected void eliminarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		request.setAttribute("idUsuario", idUsuario);
		request.getRequestDispatcher("/vistas/EliminarCuenta.jsp").forward(request, response);
	}	
	
	protected void desactivarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		request.setAttribute("idUsuario", idUsuario);
		request.getRequestDispatcher("/vistas/DesactivarCuenta.jsp").forward(request, response);
	}
	
	protected void activarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		CuentaDAO dao = new CuentaDAO();
		dao.activarCuenta(idUsuario);
		
		response.sendRedirect(request.getContextPath() + "/GestionarCuentasController?action=listar");
	}
	
	protected void confirmarAccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean decision = Boolean.parseBoolean(request.getParameter("decision"));
		String accion = request.getParameter("accion");
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		if (decision) {
			CuentaDAO dao = new CuentaDAO();
			
			switch (accion) {
			case "eliminar":
				dao.eliminarCuenta(idUsuario);
				break;
			case "desactivar":
				dao.desactivarCuenta(idUsuario);
				break;
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/GestionarCuentasController?action=listar");
	}
}