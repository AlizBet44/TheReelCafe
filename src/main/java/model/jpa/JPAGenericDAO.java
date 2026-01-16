package model.jpa;

import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import model.dao.GenericDAO;

public abstract class JPAGenericDAO<T, ID> implements GenericDAO<T, ID> {
	
	protected EntityManager entityManager;
	protected Class<T> entityClass;
	
	public JPAGenericDAO(Class<T> entityClass) {
		this.entityClass = entityClass;
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("The_ReelCafe");
		this.entityManager = emf.createEntityManager();
	}
	
	@Override
	public List<T> obtenerTodas() {
		String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e";
		Query query = entityManager.createQuery(jpql, entityClass);
		return query.getResultList();
	}
	
	@Override
	public T obtenerPorId(ID id) {
		return entityManager.find(entityClass, id);
	}
	
	@Override
	public void registrar(T entidad) {
		entityManager.getTransaction().begin();
		try {
			entityManager.persist(entidad);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			throw new RuntimeException("Error al registrar: " + e.getMessage(), e);
		}
	}
	
	@Override
	public void actualizar(T entidad) {
		entityManager.getTransaction().begin();
		try {
			entityManager.merge(entidad);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			throw new RuntimeException("Error al actualizar: " + e.getMessage(), e);
		}
	}
	
	@Override
	public void eliminar(ID id) {
		entityManager.getTransaction().begin();
		try {
			T entidad = entityManager.find(entityClass, id);
			if (entidad != null) {
				entityManager.remove(entidad);
			}
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			throw new RuntimeException("Error al eliminar: " + e.getMessage(), e);
		}
	}
	
	@Override
	public void buscarPorCriterio(String criterio) {
		// Implementación específica en las subclases si es necesaria
	}
	
	public void cerrar() {
		if (entityManager != null && entityManager.isOpen()) {
			entityManager.close();
		}
	}
}
