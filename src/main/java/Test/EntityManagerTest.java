package Test;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import model.entitys.Administrador;
import model.entitys.Pelicula;
import model.entitys.Usuario;

public class EntityManagerTest {

	public static void main(String[] args) {
		// TODO 
		System.out.println("Hola mundo");
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("The_ReelCafe");
		EntityManager em = emf.createEntityManager();
		/*
		//Crear película
		Pelicula pelicula = new Pelicula("Inception", "inception.jpg", "A mind-bending thriller", "Christopher Nolan", "inception_trailer.mp4", 148, new java.util.Date());
		
		
		//Iniciar transacción
		em.getTransaction().begin();
		em.persist(pelicula);
		em.getTransaction().commit();
		
		//consulta por ID
		Pelicula miPelicula = em.find(Pelicula.class, 1);
		System.out.println("Película encontrada: " + miPelicula.getTitulo());
		
		//todas las películas
		String consulta = "SELECT p FROM Pelicula p";
		Query query = em.createQuery(consulta);
		List<Pelicula> peliculas = (List<Pelicula>)query.getResultList();
		
		for (Pelicula pelicula2 : peliculas) {
			System.out.println(pelicula2);
		}
		*/
		
		Administrador admin = new Administrador("Juan", "aaaa", "aaa");
		Usuario user = new Usuario("pepe", "ssss", "22");
		
		em.getTransaction().begin();
		em.persist(admin);
		em.persist(user);
		em.getTransaction().commit();
		
		
		
		
	}

}
