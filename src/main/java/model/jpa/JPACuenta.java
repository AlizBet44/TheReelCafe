package model.jpa;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import model.dao.CuentaDAO;
import model.entitys.Cuenta;
import model.entitys.Usuario;
import model.entitys.Administrador;

public class JPACuenta extends JPAGenericDAO<Cuenta, Integer> implements CuentaDAO {
	
	private final EntityManager em;
	private final EntityManagerFactory emf;
	
	public JPACuenta() {
		super(Cuenta.class);
		this.emf = Persistence.createEntityManagerFactory("The_ReelCafe");
		this.em = emf.createEntityManager();
	}
	
	@Override
	public List<Cuenta> obtenerTodas() {
		try {
			TypedQuery<Cuenta> query = em.createQuery("SELECT c FROM Cuenta c", Cuenta.class);
			return query.getResultList();
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Obtener todas las cuentas - " + e.getMessage());
			return null;
		}
	}
	
	@Override
	public Cuenta obtenerPorId(Integer idUsuario) {
		try {
			return em.find(Cuenta.class, idUsuario);
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Obtener cuenta por ID - " + e.getMessage());
			return null;
		}
	}
	
	@Override
	public void eliminarCuenta(Integer idUsuario) {
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
	
	@Override
	public void desactivarCuenta(Integer idUsuario) {
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
	
	@Override
	public void activarCuenta(Integer idUsuario) {
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
	
	@Override
	public void actualizarRol(Integer idUsuario, Integer idRol) {
		em.getTransaction().begin();
		try {
			// Obtener la cuenta actual
			Cuenta cuentaVieja = em.find(Cuenta.class, idUsuario);
			
			if (cuentaVieja == null) {
				System.out.println(">>>> ERROR: Cuenta no encontrada");
				em.getTransaction().rollback();
				return;
			}
			
			// Verificar si ya tiene el rol correcto
			boolean esAdmin = cuentaVieja instanceof Administrador;
			boolean quiereSerAdmin = (idRol == 1);
			
			if (esAdmin == quiereSerAdmin) {
				System.out.println(">>>> INFO: La cuenta ya tiene el rol correcto");
				em.getTransaction().commit();
				return;
			}
			
			// Guardar datos comunes
			String nombre = cuentaVieja.getNombre();
			String correo = cuentaVieja.getCorreo();
			String cedula = null;
			Boolean estado = null;
			
			// Si es Usuario, guardar cedula y estado
			if (cuentaVieja instanceof Usuario) {
				Usuario usuarioViejo = (Usuario) cuentaVieja;
				cedula = usuarioViejo.getCedula();
				estado = usuarioViejo.getEstado();
			}
			
			// Eliminar cuenta vieja
			em.remove(cuentaVieja);
			em.flush(); // Forzar eliminación
			
			// Crear nueva cuenta con el rol correcto
			Cuenta cuentaNueva;
			if (idRol == 1) {
				// Crear Administrador
				cuentaNueva = new Administrador(nombre, correo);
			} else {
				// Crear Usuario
				Usuario usuarioNuevo = new Usuario(nombre, correo, cedula != null ? cedula : "");
				if (estado != null) {
					usuarioNuevo.setEstado(estado);
				}
				cuentaNueva = usuarioNuevo;
			}
			
			// Persistir nueva cuenta
			em.persist(cuentaNueva);
			em.getTransaction().commit();
			
			System.out.println(">>>> Rol actualizado exitosamente");
			
		} catch (Exception e) {
			System.out.println(">>>> ERROR: Actualización de rol - " + e.getMessage());
			e.printStackTrace();
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
		}
	}
	
	@Override
	public void cerrar() {
		if (em != null && em.isOpen()) {
			em.close();
		}
		if (emf != null && emf.isOpen()) {
			emf.close();
		}
	}
}
