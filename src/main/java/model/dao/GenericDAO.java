package model.dao;

import java.util.List;

public interface GenericDAO<T, ID> {
	public List<T> obtenerTodas();
	public T obtenerPorId(ID id);
	public void eliminar(ID id);
	public void registrar(T entidad);
	public void actualizar(T entidad);
	public void buscarPorCriterio(String criterio);
}
