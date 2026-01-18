package model.dao;

import java.util.List;
import model.entitys.Cuenta;


public interface CuentaDAO extends GenericDAO<Cuenta, Integer> {
	public List<Cuenta> obtenerTodas(); 
	public void actualizarRol(Integer idUsuario, Integer idRol);
	public void eliminarCuenta(Integer idUsuario);
	public void desactivarCuenta(Integer idUsuario);
	public void activarCuenta(Integer idUsuario);
}
