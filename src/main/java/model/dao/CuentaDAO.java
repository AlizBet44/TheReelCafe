package model.dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import model.entitys.Cuenta;
import model.entitys.Usuario;

public class CuentaDAO {
	
	private final EntityManager em;
	private final EntityManagerFactory emf;
	
	public CuentaDAO() {
		this.emf = Persistence.createEntityManagerFactory("The_ReelCafe");
		this.em = emf.createEntityManager();
	}
	
	public List<Cuenta> obtenerTodas() {
		try {
			TypedQuery<Cuenta> query = em.createQuery("SELECT c FROM Cuenta c", Cuenta.class);
			return query.getResultList();
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Obtener todas las cuentas - " + e.getMessage());
			return null;
		}
	}
	
	public Cuenta obtenerPorId(int idUsuario) {
		try {
			return em.find(Cuenta.class, idUsuario);
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Obtener cuenta por ID - " + e.getMessage());
			return null;
		}
	}
	
	public void eliminarCuenta(int idUsuario) {
		em.getTransaction().begin();
		try {
			Cuenta cuenta = em.find(Cuenta.class, idUsuario);
			if (cuenta != null) {
				em.remove(cuenta);
				em.getTransaction().commit();
				System.out.println(">>>> Cuenta eliminada exitosamente");
			} else {
				System.out.println(">>>> ERROR: Cuenta no encontrada");
				em.getTransaction().rollback();
			}
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Eliminación de cuenta - " + e.getMessage());
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
		}
	}
	
	public void desactivarCuenta(int idUsuario) {
		em.getTransaction().begin();
		try {
			Cuenta cuenta = em.find(Cuenta.class, idUsuario);
			if (cuenta != null && cuenta instanceof Usuario) {
				Usuario usuario = (Usuario) cuenta;
				usuario.setEstado(false);
				em.merge(usuario);
				em.getTransaction().commit();
				System.out.println(">>>> Cuenta desactivada exitosamente");
			} else {
				System.out.println(">>>> ERROR: Cuenta no encontrada o no es un Usuario");
				em.getTransaction().rollback();
			}
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Desactivación de cuenta - " + e.getMessage());
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
		}
	}
	
	public void activarCuenta(int idUsuario) {
		em.getTransaction().begin();
		try {
			Cuenta cuenta = em.find(Cuenta.class, idUsuario);
			if (cuenta != null && cuenta instanceof Usuario) {
				Usuario usuario = (Usuario) cuenta;
				usuario.setEstado(true);
				em.merge(usuario);
				em.getTransaction().commit();
				System.out.println(">>>> Cuenta activada exitosamente");
			} else {
				System.out.println(">>>> ERROR: Cuenta no encontrada o no es un Usuario");
				em.getTransaction().rollback();
			}
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Activación de cuenta - " + e.getMessage());
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
		}
	}
	
	public void actualizarRol(Integer idUsuario, Integer idRol) {
		em.getTransaction().begin();
		try {
			// Obtener la cuenta actual
			Cuenta cuentaActual = em.find(Cuenta.class, idUsuario);
			
			if (cuentaActual == null) {
				System.out.println(">>>> ERROR: Cuenta no encontrada");
				em.getTransaction().rollback();
				return;
			}
			
			// Determinar el tipo actual y el nuevo tipo
			String tipoActual = cuentaActual instanceof Usuario ? "Usuario" : "Administrador";
			String tipoNuevo = (idRol == 1) ? "Administrador" : "Usuario";
			
			// Si ya tiene el rol correcto, no hacer nada
			if (tipoActual.equals(tipoNuevo)) {
				System.out.println(">>>> INFO: La cuenta ya tiene el rol " + tipoNuevo);
				em.getTransaction().commit();
				return;
			}
			
			// Usar consulta nativa para actualizar el campo DTYPE (discriminador)
			// idRol = 1 -> Administrador
			// idRol = 2 -> Usuario
			String nuevoTipo = (idRol == 1) ? "Administrador" : "Usuario";
			
			Query query = em.createNativeQuery(
				"UPDATE Cuenta SET DTYPE = :tipo WHERE id = :id"
			);
			query.setParameter("tipo", nuevoTipo);
			query.setParameter("id", idUsuario);
			
			int filasActualizadas = query.executeUpdate();
			
			if (filasActualizadas > 0) {
				em.getTransaction().commit();
				System.out.println(">>>> Rol actualizado exitosamente a " + nuevoTipo);
			} else {
				em.getTransaction().rollback();
				System.out.println(">>>> ERROR: No se pudo actualizar el rol");
			}
			
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Actualización de rol - " + e.getMessage());
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
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
