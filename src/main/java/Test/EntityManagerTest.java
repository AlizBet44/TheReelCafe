package Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.entitys.Usuario;

public class EntityManagerTest {

	public static void main(String[] args) {
		System.out.println("=== Creando 10 usuarios aleatorios ===");
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("The_ReelCafe");
		EntityManager em = emf.createEntityManager();
		
		// Crear 10 usuarios aleatorios
		String[] nombres = {"Carlos", "María", "Pedro", "Ana", "Luis", "Sofia", "Diego", "Laura", "Miguel", "Elena"};
		String[] apellidos = {"García", "Rodríguez", "Martínez", "López", "González", "Pérez", "Sánchez", "Ramírez", "Torres", "Flores"};
		
		em.getTransaction().begin();
		try {
			for (int i = 0; i < 10; i++) {
				String nombre = nombres[i] + " " + apellidos[i];
				String correo = nombres[i].toLowerCase() + i + "@gmail.com";
				String cedula = "1000000" + (i + 1);
				
				Usuario usuario = new Usuario(nombre, correo, cedula);
				em.persist(usuario);
				System.out.println("Usuario creado: " + nombre + " - " + correo + " - Cédula: " + cedula);
			}
			em.getTransaction().commit();
			System.out.println("\n✓ 10 usuarios creados exitosamente!");
		} catch (Exception e) {
			System.out.println("Error al crear usuarios: " + e.getMessage());
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
		} finally {
			em.close();
			emf.close();
		}
		
		//Crear película
				/*Pelicula pelicula = new Pelicula("Inception", "inception.jpg", "A mind-bending thriller", "Christopher Nolan", "inception_trailer.mp4", 148, new java.util.Date());
				
				
				//Iniciar transacción
				em.getTransaction().begin();
				em.persist(pelicula);
				em.getTransaction().commit();¨
				*/
	}

}
