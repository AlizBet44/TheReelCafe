package model.jpa;

import java.util.List;
import jakarta.persistence.Query;
import model.dao.UsuarioDAO;
import model.entitys.Usuario;

public class JPAUsuario extends JPAGenericDAO<Usuario, Integer> implements UsuarioDAO {
	
	public JPAUsuario() {
		super(Usuario.class);
	}
	
	@Override
	public List<Usuario> obtenerTodos() {
		String jpql = "SELECT u FROM Usuario u";
		Query query = entityManager.createQuery(jpql, Usuario.class);
		return query.getResultList();
	}
	
	@Override
	public Usuario obtenerPorCedula(String cedula) {
		String jpql = "SELECT u FROM Usuario u WHERE u.cedula = :cedula";
		Query query = entityManager.createQuery(jpql, Usuario.class);
		query.setParameter("cedula", cedula);
		List<Usuario> resultados = query.getResultList();
		return resultados.isEmpty() ? null : resultados.get(0);
	}
	
	@Override
	public List<Usuario> obtenerUsuariosActivos() {
		String jpql = "SELECT u FROM Usuario u WHERE u.estado = true";
		Query query = entityManager.createQuery(jpql, Usuario.class);
		return query.getResultList();
	}
	
	@Override
	public List<Usuario> obtenerUsuariosInactivos() {
		String jpql = "SELECT u FROM Usuario u WHERE u.estado = false";
		Query query = entityManager.createQuery(jpql, Usuario.class);
		return query.getResultList();
	}
}
