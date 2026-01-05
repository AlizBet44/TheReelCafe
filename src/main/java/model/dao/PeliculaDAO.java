package model.dao;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import model.entitys.Pelicula;

public class PeliculaDAO {

    public List<Pelicula> obtenerTodas() {
    	EntityManagerFactory emf = Persistence.createEntityManagerFactory("The_ReelCafe");
		EntityManager em = emf.createEntityManager();
		
		String consulta = "SELECT p FROM Pelicula p";
		Query query = em.createQuery(consulta);
		List<Pelicula> peliculas = (List<Pelicula>)query.getResultList();
		return peliculas;
    }

    public boolean eliminarPelicula(int id) {
        // Lógica para eliminar una película por id
        // Retornar true si se eliminó correctamente
        return false;
    }

    public void registrarPelicula(Pelicula pelicula) {
        // Lóica para registrar/insertar una nueva película

    }

    public Pelicula obtenerDatosPelicula(int id) {
        // Obtener datos de una película por id
        return null;
    }

    public boolean actualizar(Pelicula pelicula) {
        // Actualizar los datos de la película
        return false;
    }
}
