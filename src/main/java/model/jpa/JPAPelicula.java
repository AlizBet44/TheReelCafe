package model.jpa;

import model.dao.PeliculaDAO;
import model.entitys.Pelicula;

public class JPAPelicula extends JPAGenericDAO<Pelicula, Integer> implements PeliculaDAO {
	
	public JPAPelicula() {
		super(Pelicula.class);
	}
}
