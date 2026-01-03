package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PeliculaDAO;
import model.entitys.Pelicula;

@WebServlet(name = "GestionarPeliculas", urlPatterns = {"/GestionarPeliculas"})
public class GestionarPeliculas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "listar"; // valor por defecto
		}

		switch (action) {
		case "listar":
			listar(request, response);
			break;
		case "eliminar":
			eliminar(request, response);
			break;
		case "confirmar":
			confirmar(request, response);
			break;
		case "publicar":
			publicar(request, response);
			break;
		case "llenar":
			llenar(request, response);
			break;
		case "editar":
			editar(request, response);
			break;
		case "cambiar":
			cambiar(request, response);
			break;
		default:
			// acción desconocida -> listar
			listar(request, response);
		}
	}

	// Métodos solicitados: listar, eliminar, confirmar, publicar, llenar, editar, cambiar

	protected void listar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PeliculaDAO peliculaDAO = new PeliculaDAO();
		List<Pelicula> peliculas = peliculaDAO.obtenerTodas();
		
		//llamada a la JSP
		request.setAttribute("peliculas", peliculas);
		request.getRequestDispatcher("vistas/AdministrarPeliculas.jsp").forward(request, response);
		
	}

	protected void eliminar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		// Aquí iría la lógica para eliminar la película por id
		response.sendRedirect(request.getContextPath() + "/GestionarPeliculas?action=listar");
	}

	protected void confirmar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		// Lógica para confirmar (por ejemplo, confirmar eliminación o publicación)
		response.setContentType("text/plain;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.print("confirmado:" + (id == null ? "-" : id));
		}
	}

	protected void publicar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		// Lógica para publicar/poner visible una película
		response.sendRedirect(request.getContextPath() + "/GestionarPeliculas?action=listar");
	}

	protected void llenar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Llenar formulario con datos de la película para edición
		String id = request.getParameter("id");
		request.setAttribute("peliculaId", id);
		// reenviar a una vista de edición si existiera
		request.getRequestDispatcher("/vistas/EditarPelicula.jsp").forward(request, response);
	}

	protected void editar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Leer parámetros y actualizar la entidad película
		String id = request.getParameter("id");
		// ... actualizar ...
		response.sendRedirect(request.getContextPath() + "/GestionarPeliculas?action=listar");
	}

	protected void cambiar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Acción genérica para cambiar estado/atributo de la película
		String id = request.getParameter("id");
		String campo = request.getParameter("campo");
		String valor = request.getParameter("valor");
		// ... realizar cambio ...
		response.setContentType("application/json;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.print("{\"status\":\"changed\",\"id\":\"" + (id == null ? "" : id) + "\"}");
		}
	}
}