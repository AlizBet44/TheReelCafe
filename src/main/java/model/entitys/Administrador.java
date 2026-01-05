package model.entitys;

import java.util.Objects;

import jakarta.persistence.Entity;

@Entity
public class Administrador extends Cuenta {
    private static final long serialVersionUID = 1L;

    // Constructor público sin parámetros (requerido para JavaBeans)
    public Administrador() {
        super();
    }

    // Constructor con parámetros
    public Administrador(String nombre, String correo) {
        super(nombre, correo);
    }

    // Getter y setter

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