package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.CuentaDAO;
import model.entitys.Cuenta;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class GestionarCuentasController
 */
@WebServlet("/cuentas")
public class GestionarCuentasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GestionarCuentasController() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ruteador(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ruteador(request, response);
	}
	
	public void ruteador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ruta = request.getParameter("ruta");
		if (ruta == null) {
			ruta = "listar";
		}
		switch (ruta) {
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
	
	public void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Listar");
		CuentaDAO dao = new CuentaDAO();
		List<Cuenta> listaCuentas = dao.obtenerTodas();
		
		request.setAttribute("cuentas", listaCuentas);
		request.getRequestDispatcher("vistas/AdministrarCuentas.jsp").forward(request, response);
		
	}
	
	//public void cambiarRol(int idUsuario) {
	public void cambiarRol(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		CuentaDAO dao = new CuentaDAO();
		Cuenta cuenta = dao.obtenerPorId(idUsuario);
		
		request.setAttribute("cuenta", cuenta);
		request.getRequestDispatcher("vistas/CambiarRol.jsp").forward(request, response);
	}
	
	
	
	public void guardarRol(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		Integer idRol = Integer.parseInt(request.getParameter("idRol"));
		
		CuentaDAO dao = new CuentaDAO();
		dao.actualizarRol(idUsuario, idRol);
		
		response.sendRedirect("cuentas?ruta=listar");
	}
	
	public void eliminarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		request.setAttribute("idUsuario", idUsuario);
		request.getRequestDispatcher("vistas/EliminarCuenta.jsp").forward(request, response);
	}	
	
	public void desactivarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		request.setAttribute("idUsuario", idUsuario);
		request.getRequestDispatcher("vistas/DesactivarCuenta.jsp").forward(request, response);
	}
	
	public void activarCuenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		
		CuentaDAO dao = new CuentaDAO();
		dao.activarCuenta(idUsuario);
		
		response.sendRedirect("cuentas?ruta=listar");
	}
	
	public void confirmarAccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		response.sendRedirect("cuentas?ruta=listar");
	}
	
}
