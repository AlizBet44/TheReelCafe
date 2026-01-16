package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.PeliculaDAO;
import model.dao.DAOFactory;
import model.entitys.Pelicula;

@WebServlet(name = "GestionarPeliculas", urlPatterns = { "/GestionarPeliculas" })
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

	// Métodos solicitados: listar, eliminar, confirmar, publicar, llenar, editar,
	// cambiar

	protected void listar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Usar el Factory Pattern para obtener el DAO
		DAOFactory factory = DAOFactory.getDAOFactory();
		PeliculaDAO peliculaDAO = factory.getPeliculaDAO();
		List<Pelicula> peliculas = peliculaDAO.obtenerTodas();

		// llamada a la JSP
		request.setAttribute("peliculas", peliculas);
		request.getRequestDispatcher("vistas/AdministrarPeliculas.jsp").forward(request, response);

	}

	protected void eliminar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer idPelicula = Integer.parseInt(request.getParameter("idPelicula"));

		// Eliminar la película usando el DAO
		DAOFactory factory = DAOFactory.getDAOFactory();
		PeliculaDAO peliculaDAO = factory.getPeliculaDAO();
		peliculaDAO.eliminar(idPelicula);

		// Redirigir a la lista de películas actualizada
		response.sendRedirect(request.getContextPath() + "/GestionarPeliculas?action=listar");
	}

	protected void confirmar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
		boolean decision = Boolean.parseBoolean(request.getParameter("decision"));
		String accion = request.getParameter("accion");

		if (decision) {
			DAOFactory factory = DAOFactory.getDAOFactory();
			PeliculaDAO peliculaDAO = factory.getPeliculaDAO();
			if (accion.equals("eliminar")) {
				peliculaDAO.eliminar(idPelicula);
			}
		}

		response.sendRedirect(request.getContextPath() + "/GestionarPeliculas?action=listar");
	}

	protected void publicar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Mostrar formulario para publicar nueva película
		request.getRequestDispatcher("/vistas/PublicarPelicula.jsp").forward(request, response);
	}

	protected void llenar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Info a rellenar en el form de publicacion
		String titulo = request.getParameter("titulo");
		String poster = request.getParameter("poster");
		String sinopsis = request.getParameter("sinopsis");
		String director = request.getParameter("director");
		Integer duracion = Integer.parseInt(request.getParameter("duracion"));
		String urlTrailer = request.getParameter("urlTrailer");

		Pelicula pelicula = new Pelicula();
		pelicula.setTitulo(titulo);
		pelicula.setPoster(poster);
		pelicula.setSinopsis(sinopsis);
		pelicula.setDirector(director);
		pelicula.setDuracion(duracion);
		pelicula.setTrailer(urlTrailer);

		// Usar el Factory Pattern para obtener el DAO
		DAOFactory factory = DAOFactory.getDAOFactory();
		PeliculaDAO peliculaDAO = factory.getPeliculaDAO();
		peliculaDAO.registrar(pelicula);

		response.sendRedirect(request.getContextPath() + "/GestionarPeliculas?action=listar");
	}

	protected void editar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
		// Usar el Factory Pattern para obtener el DAO
		DAOFactory factory = DAOFactory.getDAOFactory();
		PeliculaDAO peliculaDAO = factory.getPeliculaDAO();
		Pelicula pelicula = peliculaDAO.obtenerPorId(idPelicula);

		request.setAttribute("pelicula", pelicula);
		request.getRequestDispatcher("/vistas/EditarPelicula.jsp").forward(request, response);
	}

	protected void cambiar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
		String titulo = request.getParameter("titulo");
		String poster = request.getParameter("poster");
		String sinopsis = request.getParameter("sinopsis");
		String director = request.getParameter("director");
		String duracionStr = request.getParameter("duracion");
		String urlTrailer = request.getParameter("urlTrailer");

		Pelicula pelicula = new Pelicula();
		pelicula.setId(idPelicula);
		pelicula.setTitulo(titulo);
		pelicula.setPoster(poster);
		pelicula.setSinopsis(sinopsis);
		pelicula.setDirector(director);
		pelicula.setDuracion(Integer.parseInt(duracionStr));
		pelicula.setTrailer(urlTrailer);

		// Usar el Factory Pattern para obtener el DAO
		DAOFactory factory = DAOFactory.getDAOFactory();
		PeliculaDAO peliculaDAO = factory.getPeliculaDAO();
		peliculaDAO.actualizar(pelicula);
		response.sendRedirect(request.getContextPath() + "/GestionarPeliculas?action=listar");
	}
}