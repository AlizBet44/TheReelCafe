package model.entitys;

public class Administrador extends Cuenta {
    private static final long serialVersionUID = 1L; // keep serialization stable

    // Example additional property for an administrator bean
    private String clave;

    // No-arg constructor required for JavaBeans
    public Administrador() {
        super();
    }

    // Convenience constructor
    public Administrador(Integer id, String nombre, String correo, String clave) {
        super(id, nombre, correo);
        this.clave = clave;
    }

    // Getter and setter follow JavaBean conventions
    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    @Override
    public String toString() {
        // Avoid printing the raw password/clave
        return "Administrador [id=" + getId() + ", nombre=" + getNombre() + ", correo=" + getCorreo() + ", clave=****]";
    }
}