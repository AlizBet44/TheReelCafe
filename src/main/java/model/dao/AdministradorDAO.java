package model.dao;

import java.util.List;
import model.entitys.Administrador;

public interface AdministradorDAO extends GenericDAO<Administrador, Integer> {
	/**
	 * Obtiene todos los administradores registrados en el sistema.
	 */
	public List<Administrador> obtenerTodos();
}
