package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.entitys.Pelicula;

public class PeliculaDAO {

    public List<Pelicula> obtenerTodas() {
        // En una implementación real, aquí se consultaría la base de datos
        return new ArrayList<>();
    }

    public boolean eliminarPelicula(int id) {
        // Lógica para eliminar una película por id
        // Retornar true si se eliminó correctamente
        return false;
    }

    public boolean registrarPelicula(Pelicula pelicula) {
        // Lógica para registrar/insertar una nueva película
        return false;
    }

    public Pelicula obtenerDatosPelicula(int id) {
        // Obtener datos de una película por id
        return null;
    }

    public boolean actualizar(Pelicula pelicula) {
        // Actualizar los datos de la película
        return false;
    }
}
