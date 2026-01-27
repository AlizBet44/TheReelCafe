package Test;

import java.util.Date;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import model.entitys.Administrador;
import model.entitys.Pelicula;
import model.entitys.Usuario;

public class EntityManagerTest {

	public static void main(String[] args) {
		System.out.println("=== Iniciando creación de datos de prueba ===\n");
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("The_ReelCafe");
		EntityManager em = emf.createEntityManager();
		
		em.getTransaction().begin();
		try {
			// ========== CREAR 3 USUARIOS ==========
			System.out.println("--- Creando 3 Usuarios ---");
			
			Usuario usuario1 = new Usuario("Carlos García", "carlos@gmail.com", "1001234567");
			Usuario usuario2 = new Usuario("María Rodríguez", "maria@gmail.com", "1007654321");
			Usuario usuario3 = new Usuario("Pedro Martínez", "pedro@gmail.com", "1009876543");
			
			em.persist(usuario1);
			em.persist(usuario2);
			em.persist(usuario3);
			
			System.out.println("✓ Usuario creado: " + usuario1.getNombre() + " - " + usuario1.getCorreo());
			System.out.println("✓ Usuario creado: " + usuario2.getNombre() + " - " + usuario2.getCorreo());
			System.out.println("✓ Usuario creado: " + usuario3.getNombre() + " - " + usuario3.getCorreo());
			
			// ========== CREAR 3 ADMINISTRADORES ==========
			System.out.println("\n--- Creando 3 Administradores ---");
			
			Administrador admin1 = new Administrador("Admin Luis", "admin.luis@reelcafe.com");
			Administrador admin2 = new Administrador("Admin Sofia", "admin.sofia@reelcafe.com");
			Administrador admin3 = new Administrador("Admin Diego", "admin.diego@reelcafe.com");
			
			em.persist(admin1);
			em.persist(admin2);
			em.persist(admin3);
			
			System.out.println("✓ Administrador creado: " + admin1.getNombre() + " - " + admin1.getCorreo());
			System.out.println("✓ Administrador creado: " + admin2.getNombre() + " - " + admin2.getCorreo());
			System.out.println("✓ Administrador creado: " + admin3.getNombre() + " - " + admin3.getCorreo());
			
			// ========== CREAR 3 PELÍCULAS ==========
			System.out.println("\n--- Creando 3 Películas ---");
			
			Pelicula pelicula1 = new Pelicula(
				"Inception", 
				"inception.jpg", 
				"Un ladrón que roba secretos corporativos a través del uso de la tecnología de compartir sueños.", 
				"Christopher Nolan", 
				"https://youtube.com/inception", 
				148, 
				new Date()
			);
			pelicula1.setAdministrador(admin1); // Creada por Admin Luis
			
			Pelicula pelicula2 = new Pelicula(
				"The Dark Knight", 
				"dark_knight.jpg", 
				"Cuando el Joker emerge como amenaza, Batman debe aceptar una de las mayores pruebas psicológicas.", 
				"Christopher Nolan", 
				"https://youtube.com/darkknight", 
				152, 
				new Date()
			);
			pelicula2.setAdministrador(admin1); // También creada por Admin Luis
			
			Pelicula pelicula3 = new Pelicula(
				"Interstellar", 
				"interstellar.jpg", 
				"Un equipo de exploradores viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.", 
				"Christopher Nolan", 
				"https://youtube.com/interstellar", 
				169, 
				new Date()
			);
			pelicula3.setAdministrador(admin2); // Creada por Admin Sofia
			
			em.persist(pelicula1);
			em.persist(pelicula2);
			em.persist(pelicula3);
			
			System.out.println("✓ Película creada: " + pelicula1.getTitulo() + " (creada por: " + pelicula1.getAdministrador().getNombre() + ")");
			System.out.println("✓ Película creada: " + pelicula2.getTitulo() + " (creada por: " + pelicula2.getAdministrador().getNombre() + ")");
			System.out.println("✓ Película creada: " + pelicula3.getTitulo() + " (creada por: " + pelicula3.getAdministrador().getNombre() + ")");
			
			em.getTransaction().commit();
			
			System.out.println("\n===========================================");
			System.out.println("✓ Todos los datos creados exitosamente!");
			System.out.println("  - 3 Usuarios");
			System.out.println("  - 3 Administradores");
			System.out.println("  - 3 Películas (con relación a administradores)");
			System.out.println("===========================================");
			
		} catch (Exception e) {
			System.out.println("\n✗ Error al crear datos: " + e.getMessage());
			e.printStackTrace();
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
		} finally {
			em.close();
			emf.close();
		}
	}

}
