package model.dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import model.entitys.Pelicula;

public class PeliculaDAO {
	
	private final EntityManager em;
	private final EntityManagerFactory emf;
	
	public PeliculaDAO() {
		this.emf = Persistence.createEntityManagerFactory("The_ReelCafe");
		this.em = emf.createEntityManager();
	}

	public List<Pelicula> obtenerTodas() {
		try {
			TypedQuery<Pelicula> query = em.createQuery("SELECT p FROM Pelicula p", Pelicula.class);
			return query.getResultList();
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Obtener todas las películas - " + e.getMessage());
			return null;
		}
	}

	public boolean eliminarPelicula(int id) {
		em.getTransaction().begin();
		try {
			Pelicula pelicula = em.find(Pelicula.class, id);
			if (pelicula != null) {
				em.remove(pelicula);
				em.getTransaction().commit();
				System.out.println(">>>> Película eliminada exitosamente");
				return true;
			} else {
				System.out.println(">>>> ERROR: Película no encontrada");
				em.getTransaction().rollback();
				return false;
			}
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Eliminación de película - " + e.getMessage());
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			return false;
		}
	}

	public void registrarPelicula(Pelicula pelicula) {
		em.getTransaction().begin();
		try {
			em.persist(pelicula);
			em.getTransaction().commit();
			System.out.println(">>>> Película registrada exitosamente");
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Registro de película - " + e.getMessage());
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
		}
	}

	public Pelicula obtenerDatosPelicula(int id) {
		try {
			return em.find(Pelicula.class, id);
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Obtener película por ID - " + e.getMessage());
			return null;
		}
	}

	public boolean actualizar(Pelicula pelicula) {
		em.getTransaction().begin();
		try {
			em.merge(pelicula);
			em.getTransaction().commit();
			System.out.println(">>>> Película actualizada exitosamente");
			return true;
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Actualización de película - " + e.getMessage());
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			return false;
		}
	}

	public List<Pelicula> obtenerPelicula(String criterio) {
		try {
			String query = "SELECT p FROM Pelicula p WHERE LOWER(p.titulo) LIKE LOWER(:criterio) OR LOWER(p.director) LIKE LOWER(:criterio) OR LOWER(p.sinopsis) LIKE LOWER(:criterio)";
			TypedQuery<Pelicula> typedQuery = em.createQuery(query, Pelicula.class);
			typedQuery.setParameter("criterio", "%" + criterio + "%");
			return typedQuery.getResultList();
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Búsqueda de película - " + e.getMessage());
			return null;
		}
	}
	
	public void cerrar() {
		if (em != null && em.isOpen()) {
			em.close();
		}
		if (emf != null && emf.isOpen()) {
			emf.close();
		}
	}
}
