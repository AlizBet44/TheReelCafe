package model.jpa;

import model.dao.AdministradorDAO;
import model.dao.UsuarioDAO;

public class JPADAOFactory extends model.dao.DAOFactory {
	@Override
	public model.dao.CuentaDAO getCuentaDAO() {
		return new JPACuenta();
	}

	@Override
	public model.dao.PeliculaDAO getPeliculaDAO() {
		return new JPAPelicula();
	}

	@Override
	public UsuarioDAO getUsuarioDAO() {
		return new JPAUsuario();
	}

	@Override
	public AdministradorDAO getAdministradorDAO() {
		return new JPAAdministrador();
	}
}
