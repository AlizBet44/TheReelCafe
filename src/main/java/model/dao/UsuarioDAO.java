package model.dao;

import java.util.List;
import model.entitys.Usuario;

public interface UsuarioDAO extends GenericDAO<Usuario, Integer> {
	/**
	 * Obtiene todos los usuarios registrados en el sistema.
	 * Esta interfaz es opcional pero puede ser útil para consultas específicas de usuarios.
	 */
	public List<Usuario> obtenerTodos();
	
	/**
	 * Obtiene un usuario por su cédula.
	 */
	public Usuario obtenerPorCedula(String cedula);
	
	/**
	 * Obtiene todos los usuarios activos.
	 */
	public List<Usuario> obtenerUsuariosActivos();
	
	/**
	 * Obtiene todos los usuarios inactivos.
	 */
	public List<Usuario> obtenerUsuariosInactivos();
}
