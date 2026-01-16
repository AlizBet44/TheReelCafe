package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.entitys.Pelicula;
import model.dao.PeliculaDAO;
import model.dao.DAOFactory;

/**
 * Servlet implementation class BuscarPeliculasController
 */
@WebServlet(name = "BuscarPeliculasController", urlPatterns = {"/BuscarPeliculasController", "/peliculas/buscar"})
public class BuscarPeliculasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuscarPeliculasController() {
        
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
			action = "buscar";
		}
		
		switch (action) {
		case "buscar":
			String criterio = request.getParameter("criterio");
			if (criterio != null && !criterio.isEmpty()) {
				ingresarTexto(criterio, request, response);
			} else {
				request.setAttribute("mensajeError", "Por favor, ingrese un criterio de búsqueda");
				request.getRequestDispatcher("/vistas/NoResultadosBusqueda.jsp").forward(request, response);
			}
			break;
		default:
			request.setAttribute("mensajeError", "Acción no válida");
			request.getRequestDispatcher("/vistas/NoResultadosBusqueda.jsp").forward(request, response);
			break;
		}
	}

	/**
	 * Método para buscar películas según un criterio de búsqueda.
	 * Busca en los campos: título, director y sinopsis.
	 * 
	 * @param criterio El texto a buscar en las películas
	 * @param request El objeto HttpServletRequest
	 * @param response El objeto HttpServletResponse
	 */
	protected void ingresarTexto(String criterio, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Usar el Factory Pattern para obtener el DAO
			DAOFactory factory = DAOFactory.getDAOFactory();
			PeliculaDAO peliculaDAO = factory.getPeliculaDAO();
			List<Pelicula> peliculasEncontradas = peliculaDAO.obtenerTodas();
			
			// Filtrar resultados localmente según el criterio
			List<Pelicula> resultadosFiltrados = peliculasEncontradas.stream()
				.filter(p -> p.getTitulo().toLowerCase().contains(criterio.toLowerCase()) ||
						p.getDirector().toLowerCase().contains(criterio.toLowerCase()) ||
						p.getSinopsis().toLowerCase().contains(criterio.toLowerCase()))
				.toList();
			
			if (resultadosFiltrados != null && !resultadosFiltrados.isEmpty()) {
				// Hay resultados
				request.setAttribute("peliculas", resultadosFiltrados);
				request.setAttribute("criterio", criterio);
				request.setAttribute("cantidadResultados", resultadosFiltrados.size());
				request.getRequestDispatcher("/vistas/ResultadosBusqueda.jsp").forward(request, response);
			} else {
				// No hay resultados
				request.setAttribute("criterio", criterio);
				request.setAttribute("mensajeError", "No se encontraron películas que coincidan con el criterio: \"" + criterio + "\"");
				request.getRequestDispatcher("/vistas/NoResultadosBusqueda.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			System.out.println(">>>> ERROR en búsqueda de películas: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("mensajeError", "Error al realizar la búsqueda: " + e.getMessage());
			request.getRequestDispatcher("/vistas/NoResultadosBusqueda.jsp").forward(request, response);
		}
	}

	
}