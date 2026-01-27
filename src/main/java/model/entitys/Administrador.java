package model.entitys;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;

@Entity
public class Administrador extends Cuenta {
    private static final long serialVersionUID = 1L;

    @OneToMany(mappedBy = "administrador", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Pelicula> peliculas = new ArrayList<>();

    // Constructor público sin parámetros (requerido para JavaBeans)
    public Administrador() {
        super();
    }

    // Constructor con parámetros
    public Administrador(String nombre, String correo) {
        super(nombre, correo);
    }

    // Getter y setter para peliculas
    public List<Pelicula> getPeliculas() {
        return peliculas;
    }

    public void setPeliculas(List<Pelicula> peliculas) {
        this.peliculas = peliculas;
    }
    
    // Método auxiliar para agregar película
    public void agregarPelicula(Pelicula pelicula) {
        peliculas.add(pelicula);
        pelicula.setAdministrador(this);
    }

    @Override
    public String toString() {
        // Evita imprimir la contraseña/clave sin encriptar
        return "Administrador [id=" + getId() + ", nombre=" + getNombre() + ", correo=" + getCorreo() + "]";
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }

    @Override
    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (other == null || getClass() != other.getClass()) {
            return false;
        }
        Administrador admin = (Administrador) other;
        return Objects.equals(getId(), admin.getId());
    }
}