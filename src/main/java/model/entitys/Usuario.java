package model.entitys;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

@Entity
public class Usuario extends Cuenta{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "cedula")
	private String cedula;
	
	@Column(name = "estado")
	private Boolean estado;
	
	// Constructor público sin parámetros (requerido para JavaBeans)
	public Usuario(){
		super();
		this.estado = true; // Por defecto activo
	}

	// Constructor con parámetros
	public Usuario(String nombre, String correo, String cedula) {
		super(nombre, correo);
		this.cedula = cedula;
		this.estado = true; // Por defecto activo
	}
	
	// Constructor completo
	public Usuario(String nombre, String correo, String cedula, Boolean estado) {
		super(nombre, correo);
		this.cedula = cedula;
		this.estado = estado;
	}

	// Getters y setters
	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	
	public Boolean getEstado() {
		return estado;
	}

	public void setEstado(Boolean estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + getId() + ", nombre=" + getNombre() + ", correo=" + getCorreo() 
				+ ", cedula=" + cedula + ", estado=" + estado + "]";
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
		Usuario usuario = (Usuario) other;
		return Objects.equals(getId(), usuario.getId());
	}
}
