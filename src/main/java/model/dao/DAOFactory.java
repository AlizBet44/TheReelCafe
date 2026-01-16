package model.dao;

import model.jpa.JPADAOFactory;

public abstract class DAOFactory {
	protected static DAOFactory instancia;
	
	public static DAOFactory getDAOFactory() {
		if (instancia == null) {
			instancia = new JPADAOFactory();
		}
		return instancia;
	}
	
	public abstract CuentaDAO getCuentaDAO();
	public abstract UsuarioDAO getUsuarioDAO();
	public abstract AdministradorDAO getAdministradorDAO();
	public abstract PeliculaDAO getPeliculaDAO();
}
