package model.jpa;

import java.util.List;
import jakarta.persistence.Query;
import model.dao.AdministradorDAO;
import model.entitys.Administrador;

public class JPAAdministrador extends JPAGenericDAO<Administrador, Integer> implements AdministradorDAO {
	
	public JPAAdministrador() {
		super(Administrador.class);
	}
	
	@Override
	public List<Administrador> obtenerTodos() {
		String jpql = "SELECT a FROM Administrador a";
		Query query = entityManager.createQuery(jpql, Administrador.class);
		return query.getResultList();
	}
}
