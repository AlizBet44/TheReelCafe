package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PeliculaDAO;
import model.entitys.Pelicula;

/**
 * Servlet implementation class visualizarPeliculaController
 */
@WebServlet(name = "visualizarPeliculaController", urlPatterns = { "/visualizarPeliculaController", "/pelicula/detalle" })
public class visualizarPeliculaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public visualizarPeliculaController() {
		super();
	}

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
		if (action == null || action.isEmpty()) {
			action = "ampliarPelicula";
		}

		switch (action) {
		case "ampliarPelicula":
			ampliarPelicula(request, response);
			break;
		default:
			ampliarPelicula(request, response);
			break;
		}
	}

	protected void ampliarPelicula(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String idPeliculaStr = request.getParameter("idPelicula");

			if (idPeliculaStr == null || idPeliculaStr.isEmpty()) {
				request.setAttribute("mensajeError", "ID de película no proporcionado");
				request.getRequestDispatcher("/vistas/detallePelicula.jsp").forward(request, response);
				return;
			}

			Integer idPelicula = Integer.parseInt(idPeliculaStr);

			PeliculaDAO peliculaDAO = new PeliculaDAO();
			Pelicula pelicula = peliculaDAO.obtenerDatosPelicula(idPelicula);

			if (pelicula != null) {
				request.setAttribute("pelicula", pelicula);
				request.getRequestDispatcher("/vistas/detallePelicula.jsp").forward(request, response);
			} else {
				request.setAttribute("mensajeError", "La película no fue encontrada");
				request.getRequestDispatcher("/vistas/detallePelicula.jsp").forward(request, response);
			}

			peliculaDAO.cerrar();

		} catch (NumberFormatException e) {
			System.out.println(">>>> ERROR: Formato de ID inválido - " + e.getMessage());
			request.setAttribute("mensajeError", "El ID de película no es válido");
			try {
				request.getRequestDispatcher("/vistas/detallePelicula.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(">>>> ERROR en ampliarPelicula: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("mensajeError", "Error al cargar la película: " + e.getMessage());
			try {
				request.getRequestDispatcher("/vistas/detallePelicula.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				e1.printStackTrace();
			}
		}
	}
}
