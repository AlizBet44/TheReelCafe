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
		default:
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
	public void cambiarRol(HttpServletRequest request, HttpServletResponse response) {
		//Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		System.out.println("Cambiar rol");
	}
	
	
	
	public void guardarRol(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Guardar rol");
	}

}
